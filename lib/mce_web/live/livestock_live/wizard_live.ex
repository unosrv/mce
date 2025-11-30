defmodule MceWeb.LivestockLive.WizardLive do
  @moduledoc """
  5-step wizard for creating/editing livestock groups.

  Steps:
  1. Basic Info - Name, species, head count, weight parameters
  2. Feed - Feed items with nutritional data
  3. Housing - Monthly housing location percentages
  4. Barn Info - Barn type, area, temperature, bedding
  5. Manure - Manure management systems
  """
  use MceWeb, :live_view

  alias Mce.Farms
  alias Mce.Livestock
  alias Mce.Livestock.{LivestockGroup, FeedItem, HousingPeriod, BarnInfo, ManureSystem}

  @steps [:basic_info, :feed, :housing, :barn_info, :manure]
  @species_options [
    {"beef_cattle", "Beef Cattle"},
    {"dairy_cattle", "Dairy Cattle"},
    {"swine", "Swine"}
  ]
  @feed_types [
    {"forage", "Forage"},
    {"concentrate", "Concentrate"},
    {"byproduct", "Byproduct"},
    {"supplement", "Supplement"}
  ]
  @barn_types [
    {"tie_stall", "Tie Stall"},
    {"free_stall", "Free Stall"},
    {"open_lot", "Open Lot"},
    {"deep_bedding", "Deep Bedding"},
    {"other", "Other"}
  ]
  @bedding_types [
    {"straw", "Straw"},
    {"sawdust", "Sawdust"},
    {"sand", "Sand"},
    {"rubber_mats", "Rubber Mats"},
    {"none", "None"},
    {"other", "Other"}
  ]
  @bedding_frequencies [
    {"daily", "Daily"},
    {"weekly", "Weekly"},
    {"bi_weekly", "Bi-weekly"},
    {"monthly", "Monthly"},
    {"as_needed", "As Needed"}
  ]
  @manure_system_types [
    {"lagoon", "Lagoon"},
    {"liquid_slurry", "Liquid/Slurry"},
    {"solid_storage", "Solid Storage"},
    {"daily_spread", "Daily Spread"},
    {"pasture", "Pasture"},
    {"deep_pit", "Deep Pit"},
    {"compost", "Compost"},
    {"other", "Other"}
  ]

  @impl true
  def mount(%{"farm_id" => farm_id} = params, _session, socket) do
    farm = Farms.get_farm_for_user(farm_id, socket.assigns.current_scope.user.id)

    if farm do
      socket =
        socket
        |> assign(:farm, farm)
        |> assign(:current_step, :basic_info)
        |> assign(:steps, @steps)
        |> assign(:species_options, @species_options)
        |> assign(:feed_types, @feed_types)
        |> assign(:barn_types, @barn_types)
        |> assign(:bedding_types, @bedding_types)
        |> assign(:bedding_frequencies, @bedding_frequencies)
        |> assign(:manure_system_types, @manure_system_types)
        |> assign(:current_url, "/farms")
        |> load_or_init_livestock_group(params)

      {:ok, socket}
    else
      {:ok,
       socket
       |> put_flash(:error, gettext("Farm not found"))
       |> push_navigate(to: ~p"/farms")}
    end
  end

  defp load_or_init_livestock_group(socket, %{"id" => id}) do
    livestock_group = Livestock.get_livestock_group!(id)
    feed_items = Livestock.list_feed_items(id)
    housing_periods = Livestock.list_housing_periods(id)
    barn_info = Livestock.get_barn_info(id) || %BarnInfo{livestock_group_id: id}
    manure_systems = Livestock.list_manure_systems(id)

    socket
    |> assign(:livestock_group, livestock_group)
    |> assign(:is_edit, true)
    |> assign(:page_title, gettext("Edit Livestock Group"))
    |> assign(:basic_form, to_form(Livestock.change_livestock_group(livestock_group)))
    |> init_feed_items(feed_items)
    |> init_housing_periods(housing_periods)
    |> assign(:barn_form, to_form(Livestock.change_barn_info(barn_info)))
    |> assign(:barn_info, barn_info)
    |> init_manure_systems(manure_systems)
  end

  defp load_or_init_livestock_group(socket, _params) do
    livestock_group = %LivestockGroup{farm_id: socket.assigns.farm.id}

    socket
    |> assign(:livestock_group, livestock_group)
    |> assign(:is_edit, false)
    |> assign(:page_title, gettext("New Livestock Group"))
    |> assign(:basic_form, to_form(Livestock.change_livestock_group(livestock_group)))
    |> init_feed_items([])
    |> init_housing_periods([])
    |> assign(:barn_form, to_form(Livestock.change_barn_info(%BarnInfo{})))
    |> assign(:barn_info, %BarnInfo{})
    |> init_manure_systems([])
  end

  defp init_feed_items(socket, feed_items) do
    feed_items =
      if Enum.empty?(feed_items) do
        [%FeedItem{is_main_diet: true}]
      else
        feed_items
      end

    socket
    |> assign(:feed_items, feed_items)
    |> assign(:feed_forms, Enum.map(feed_items, &to_form(Livestock.change_feed_item(&1))))
  end

  defp init_housing_periods(socket, housing_periods) do
    housing_periods =
      if Enum.empty?(housing_periods) do
        Enum.map(1..12, fn month ->
          %HousingPeriod{
            month: month,
            barn_percentage: Decimal.new("100"),
            exercise_yard_percentage: Decimal.new("0"),
            grazing_percentage: Decimal.new("0")
          }
        end)
      else
        housing_periods
      end

    socket
    |> assign(:housing_periods, housing_periods)
    |> assign(
      :housing_forms,
      Enum.map(housing_periods, &to_form(Livestock.change_housing_period(&1)))
    )
  end

  defp init_manure_systems(socket, manure_systems) do
    manure_systems =
      if Enum.empty?(manure_systems) do
        [%ManureSystem{percentage: Decimal.new("100")}]
      else
        manure_systems
      end

    socket
    |> assign(:manure_systems, manure_systems)
    |> assign(
      :manure_forms,
      Enum.map(manure_systems, &to_form(Livestock.change_manure_system(&1)))
    )
  end

  @impl true
  def handle_params(_params, _url, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("validate_basic", %{"livestock_group" => params}, socket) do
    changeset =
      socket.assigns.livestock_group
      |> Livestock.change_livestock_group(params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :basic_form, to_form(changeset))}
  end

  def handle_event("save_basic", %{"livestock_group" => params}, socket) do
    save_basic_info(socket, params)
  end

  def handle_event("validate_feed", %{"feed_item" => params}, socket) do
    index = String.to_integer(params["_index"] || "0")
    feed_item = Enum.at(socket.assigns.feed_items, index) || %FeedItem{}

    changeset =
      feed_item
      |> Livestock.change_feed_item(params)
      |> Map.put(:action, :validate)

    feed_forms = List.replace_at(socket.assigns.feed_forms, index, to_form(changeset))
    {:noreply, assign(socket, :feed_forms, feed_forms)}
  end

  def handle_event("add_feed_item", _params, socket) do
    new_item = %FeedItem{}
    new_form = to_form(Livestock.change_feed_item(new_item))

    {:noreply,
     socket
     |> assign(:feed_items, socket.assigns.feed_items ++ [new_item])
     |> assign(:feed_forms, socket.assigns.feed_forms ++ [new_form])}
  end

  def handle_event("remove_feed_item", %{"index" => index}, socket) do
    index = String.to_integer(index)
    feed_items = List.delete_at(socket.assigns.feed_items, index)
    feed_forms = List.delete_at(socket.assigns.feed_forms, index)

    {:noreply,
     socket
     |> assign(:feed_items, feed_items)
     |> assign(:feed_forms, feed_forms)}
  end

  def handle_event("save_feed", params, socket) do
    livestock_group_id = socket.assigns.livestock_group.id

    # Map short form field names to schema field names
    field_mapping = %{
      "type" => "feed_type",
      "name" => "feed_name",
      "amount" => "daily_amount",
      "dm" => "dry_matter_percentage",
      "ge" => "gross_energy",
      "digest" => "digestibility",
      "protein" => "crude_protein",
      "main" => "is_main_diet"
    }

    # Parse feed items from form params
    feed_params =
      params
      |> Enum.filter(fn {k, _v} -> String.starts_with?(k, "feed_") end)
      |> Enum.group_by(
        fn {k, _v} ->
          [_, index | _] = String.split(k, "_")
          index
        end,
        fn {k, v} ->
          short_field =
            k
            |> String.split("_")
            |> Enum.drop(2)
            |> Enum.join("_")

          # Map to schema field name
          field = Map.get(field_mapping, short_field, short_field)
          {field, v}
        end
      )
      |> Enum.map(fn {_index, fields} -> Map.new(fields) end)

    # Delete existing feed items and create new ones
    socket.assigns.feed_items
    |> Enum.filter(& &1.id)
    |> Enum.each(&Livestock.delete_feed_item/1)

    results =
      Enum.map(feed_params, fn feed_data ->
        feed_data
        |> Map.put("livestock_group_id", livestock_group_id)
        |> then(&Livestock.create_feed_item/1)
      end)

    if Enum.all?(results, fn {status, _} -> status == :ok end) do
      feed_items = Enum.map(results, fn {:ok, item} -> item end)

      {:noreply,
       socket
       |> init_feed_items(feed_items)
       |> assign(:current_step, :housing)
       |> put_flash(:info, gettext("Feed information saved"))}
    else
      {:noreply, put_flash(socket, :error, gettext("Error saving feed items"))}
    end
  end

  def handle_event("validate_housing", %{"housing_period" => params}, socket) do
    month = String.to_integer(params["month"] || "1")
    index = month - 1
    housing_period = Enum.at(socket.assigns.housing_periods, index) || %HousingPeriod{}

    changeset =
      housing_period
      |> Livestock.change_housing_period(params)
      |> Map.put(:action, :validate)

    housing_forms = List.replace_at(socket.assigns.housing_forms, index, to_form(changeset))
    {:noreply, assign(socket, :housing_forms, housing_forms)}
  end

  def handle_event("save_housing", params, socket) do
    livestock_group_id = socket.assigns.livestock_group.id

    # Parse housing periods from form params
    housing_params =
      1..12
      |> Enum.map(fn month ->
        %{
          month: month,
          barn_percentage: params["housing_#{month}_barn"] || "100",
          exercise_yard_percentage: params["housing_#{month}_yard"] || "0",
          grazing_percentage: params["housing_#{month}_grazing"] || "0"
        }
      end)

    case Livestock.upsert_housing_periods(livestock_group_id, housing_params) do
      {:ok, housing_periods} ->
        {:noreply,
         socket
         |> init_housing_periods(housing_periods)
         |> assign(:current_step, :barn_info)
         |> put_flash(:info, gettext("Housing information saved"))}

      {:error, _} ->
        {:noreply, put_flash(socket, :error, gettext("Error saving housing periods"))}
    end
  end

  def handle_event("validate_barn", %{"barn_info" => params}, socket) do
    changeset =
      socket.assigns.barn_info
      |> Livestock.change_barn_info(params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :barn_form, to_form(changeset))}
  end

  def handle_event("save_barn", %{"barn_info" => params}, socket) do
    livestock_group_id = socket.assigns.livestock_group.id

    case Livestock.upsert_barn_info(livestock_group_id, params) do
      {:ok, barn_info} ->
        {:noreply,
         socket
         |> assign(:barn_info, barn_info)
         |> assign(:barn_form, to_form(Livestock.change_barn_info(barn_info)))
         |> assign(:current_step, :manure)
         |> put_flash(:info, gettext("Barn information saved"))}

      {:error, changeset} ->
        {:noreply, assign(socket, :barn_form, to_form(changeset))}
    end
  end

  def handle_event("validate_manure", %{"manure_system" => params}, socket) do
    index = String.to_integer(params["_index"] || "0")
    manure_system = Enum.at(socket.assigns.manure_systems, index) || %ManureSystem{}

    changeset =
      manure_system
      |> Livestock.change_manure_system(params)
      |> Map.put(:action, :validate)

    manure_forms = List.replace_at(socket.assigns.manure_forms, index, to_form(changeset))
    {:noreply, assign(socket, :manure_forms, manure_forms)}
  end

  def handle_event("add_manure_system", _params, socket) do
    new_system = %ManureSystem{}
    new_form = to_form(Livestock.change_manure_system(new_system))

    {:noreply,
     socket
     |> assign(:manure_systems, socket.assigns.manure_systems ++ [new_system])
     |> assign(:manure_forms, socket.assigns.manure_forms ++ [new_form])}
  end

  def handle_event("remove_manure_system", %{"index" => index}, socket) do
    index = String.to_integer(index)
    manure_systems = List.delete_at(socket.assigns.manure_systems, index)
    manure_forms = List.delete_at(socket.assigns.manure_forms, index)

    {:noreply,
     socket
     |> assign(:manure_systems, manure_systems)
     |> assign(:manure_forms, manure_forms)}
  end

  def handle_event("save_manure", params, socket) do
    livestock_group_id = socket.assigns.livestock_group.id

    # Parse manure systems from form params
    # Field name mapping from form to schema
    field_mapping = %{
      "type" => "system_type",
      "storage" => "storage_duration_days"
    }

    manure_params =
      params
      |> Enum.filter(fn {k, _v} -> String.starts_with?(k, "manure_") end)
      |> Enum.group_by(
        fn {k, _v} ->
          [_, index | _] = String.split(k, "_")
          index
        end,
        fn {k, v} ->
          field =
            k
            |> String.split("_")
            |> Enum.drop(2)
            |> Enum.join("_")

          # Map form field names to schema field names
          mapped_field = Map.get(field_mapping, field, field)
          {mapped_field, v}
        end
      )
      |> Enum.map(fn {_index, fields} -> Map.new(fields) end)

    # Delete existing manure systems and create new ones
    socket.assigns.manure_systems
    |> Enum.filter(& &1.id)
    |> Enum.each(&Livestock.delete_manure_system/1)

    results =
      Enum.map(manure_params, fn manure_data ->
        manure_data
        |> Map.put("livestock_group_id", livestock_group_id)
        |> then(&Livestock.create_manure_system/1)
      end)

    if Enum.all?(results, fn {status, _} -> status == :ok end) do
      # Mark the livestock group as complete
      Livestock.complete_livestock_group(socket.assigns.livestock_group)

      {:noreply,
       socket
       |> put_flash(:info, gettext("Livestock group saved successfully"))
       |> push_navigate(to: ~p"/farms/#{socket.assigns.farm.id}")}
    else
      {:noreply, put_flash(socket, :error, gettext("Error saving manure systems"))}
    end
  end

  def handle_event("go_to_step", %{"step" => step}, socket) do
    step = String.to_existing_atom(step)

    # Only allow going back or to completed steps
    current_index = Enum.find_index(@steps, &(&1 == socket.assigns.current_step))
    target_index = Enum.find_index(@steps, &(&1 == step))

    if target_index <= current_index and socket.assigns.is_edit do
      {:noreply, assign(socket, :current_step, step)}
    else
      {:noreply, socket}
    end
  end

  def handle_event("prev_step", _params, socket) do
    current_index = Enum.find_index(@steps, &(&1 == socket.assigns.current_step))

    if current_index > 0 do
      {:noreply, assign(socket, :current_step, Enum.at(@steps, current_index - 1))}
    else
      {:noreply, socket}
    end
  end

  def handle_event("save_draft", _params, socket) do
    livestock_group = socket.assigns.livestock_group

    if livestock_group.id do
      case Livestock.save_as_draft(livestock_group, socket.assigns.current_step) do
        {:ok, _} ->
          {:noreply,
           socket
           |> put_flash(:info, gettext("Draft saved successfully"))
           |> push_navigate(to: ~p"/farms/#{socket.assigns.farm.id}")}

        {:error, _} ->
          {:noreply, put_flash(socket, :error, gettext("Error saving draft"))}
      end
    else
      {:noreply,
       socket
       |> put_flash(
         :warning,
         gettext("Please complete the basic info step first to save as draft")
       )}
    end
  end

  defp save_basic_info(socket, params) do
    params = Map.put(params, "farm_id", socket.assigns.farm.id)

    result =
      if socket.assigns.is_edit do
        Livestock.update_livestock_group(socket.assigns.livestock_group, params)
      else
        Livestock.create_livestock_group(params)
      end

    case result do
      {:ok, livestock_group} ->
        {:noreply,
         socket
         |> assign(:livestock_group, livestock_group)
         |> assign(:is_edit, true)
         |> assign(:current_step, :feed)
         |> put_flash(:info, gettext("Basic information saved"))}

      {:error, changeset} ->
        {:noreply, assign(socket, :basic_form, to_form(changeset))}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.dashboard_layout
      flash={@flash}
      current_scope={@current_scope}
      current_url={@current_url}
      locale={@locale}
    >
      <div class="container mx-auto px-4 py-6 max-w-4xl">
        <.header>
          <div class="flex items-center gap-2">
            <.link navigate={~p"/farms/#{@farm.id}"} class="btn btn-ghost btn-sm btn-square">
              <.icon name="hero-arrow-left" class="size-5" />
            </.link>
            <.icon name="hero-clipboard-document-list" class="size-8 text-primary" />
            <span>{@page_title}</span>
          </div>
          <:subtitle>
            {gettext("Farm")}: {@farm.name}
          </:subtitle>
        </.header>

        <div class="mt-8">
          <.step_indicator steps={@steps} current_step={@current_step} is_edit={@is_edit} />

          <div class="card bg-base-100 shadow-xl mt-6">
            <div class="card-body">
              <%= case @current_step do %>
                <% :basic_info -> %>
                  <.step_basic_info
                    form={@basic_form}
                    species_options={@species_options}
                    livestock_group={@livestock_group}
                  />
                <% :feed -> %>
                  <.step_feed
                    forms={@feed_forms}
                    feed_types={@feed_types}
                    livestock_group={@livestock_group}
                  />
                <% :housing -> %>
                  <.step_housing
                    forms={@housing_forms}
                    housing_periods={@housing_periods}
                  />
                <% :barn_info -> %>
                  <.step_barn_info
                    form={@barn_form}
                    barn_types={@barn_types}
                    bedding_types={@bedding_types}
                    bedding_frequencies={@bedding_frequencies}
                  />
                <% :manure -> %>
                  <.step_manure
                    forms={@manure_forms}
                    manure_system_types={@manure_system_types}
                  />
              <% end %>
            </div>
          </div>
        </div>
      </div>
    </Layouts.dashboard_layout>
    """
  end

  # Step indicator component
  attr :steps, :list, required: true
  attr :current_step, :atom, required: true
  attr :is_edit, :boolean, required: true

  defp step_indicator(assigns) do
    step_labels = %{
      basic_info: gettext("Basic Info"),
      feed: gettext("Feed"),
      housing: gettext("Housing"),
      barn_info: gettext("Barn Info"),
      manure: gettext("Manure")
    }

    assigns = assign(assigns, :step_labels, step_labels)

    ~H"""
    <ul class="steps steps-horizontal w-full">
      <%= for {step, index} <- Enum.with_index(@steps) do %>
        <li
          class={[
            "step cursor-pointer",
            step == @current_step && "step-primary",
            Enum.find_index(@steps, &(&1 == @current_step)) > index && "step-primary"
          ]}
          phx-click={@is_edit && "go_to_step"}
          phx-value-step={step}
        >
          <span class="hidden sm:inline">{Map.get(@step_labels, step)}</span>
          <span class="sm:hidden">{index + 1}</span>
        </li>
      <% end %>
    </ul>
    """
  end

  # Step 1: Basic Info
  attr :form, :any, required: true
  attr :species_options, :list, required: true
  attr :livestock_group, :any, required: true

  defp step_basic_info(assigns) do
    ~H"""
    <h2 class="card-title mb-4">
      <.icon name="hero-identification" class="size-6" />
      {gettext("Basic Information")}
    </h2>

    <.form for={@form} id="basic-info-form" phx-change="validate_basic" phx-submit="save_basic">
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div class="form-control">
          <.input
            field={@form[:name]}
            type="text"
            label={gettext("Group Name")}
            placeholder={gettext("e.g., Dairy Herd A")}
            required
          />
        </div>

        <div class="form-control">
          <.input
            field={@form[:species]}
            type="select"
            label={gettext("Species")}
            prompt={gettext("Select species...")}
            options={Enum.map(@species_options, fn {v, l} -> {l, v} end)}
            required
          />
        </div>

        <div class="form-control">
          <.input
            field={@form[:head_count]}
            type="number"
            label={gettext("Head Count")}
            min="1"
            required
          />
        </div>

        <div class="form-control">
          <.input
            field={@form[:sub_category]}
            type="text"
            label={gettext("Sub Category")}
            placeholder={gettext("e.g., Holstein, Angus")}
          />
        </div>
      </div>

      <div class="divider">{gettext("Weight Parameters")}</div>

      <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div class="form-control">
          <.input
            field={@form[:average_weight]}
            type="number"
            label={gettext("Average Weight (kg)")}
            step="0.1"
            min="0"
          />
        </div>

        <div class="form-control">
          <.input
            field={@form[:mature_weight]}
            type="number"
            label={gettext("Mature Weight (kg)")}
            step="0.1"
            min="0"
          />
        </div>

        <div class="form-control">
          <.input
            field={@form[:daily_weight_gain]}
            type="number"
            label={gettext("Daily Weight Gain (kg)")}
            step="0.01"
            min="0"
          />
        </div>
      </div>

      <div class="divider">{gettext("Dairy Parameters")}</div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div class="form-control">
          <.input
            field={@form[:milk_yield]}
            type="number"
            label={gettext("Milk Yield (L/day)")}
            step="0.1"
            min="0"
          />
        </div>

        <div class="form-control">
          <.input
            field={@form[:milk_fat_content]}
            type="number"
            label={gettext("Milk Fat Content (%)")}
            step="0.1"
            min="0"
            max="100"
          />
        </div>
      </div>

      <div class="divider">{gettext("Pregnancy & Grazing")}</div>

      <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div class="form-control">
          <.input
            field={@form[:pregnant_percentage]}
            type="number"
            label={gettext("Pregnant (%)")}
            step="0.1"
            min="0"
            max="100"
          />
        </div>

        <div class="form-control">
          <.input
            field={@form[:days_pregnant]}
            type="number"
            label={gettext("Days Pregnant")}
            min="0"
          />
        </div>

        <div class="form-control">
          <.input
            field={@form[:grazing_hours_per_day]}
            type="number"
            label={gettext("Grazing Hours/Day")}
            step="0.5"
            min="0"
            max="24"
          />
        </div>
      </div>

      <div class="card-actions justify-between mt-6">
        <.link navigate={~p"/farms/#{@livestock_group.farm_id}"} class="btn btn-ghost">
          {gettext("Cancel")}
        </.link>
        <div class="flex gap-2">
          <button
            :if={@livestock_group.id}
            type="button"
            class="btn btn-outline"
            phx-click="save_draft"
          >
            <.icon name="hero-document" class="size-5" />
            {gettext("Save Draft")}
          </button>
          <button type="submit" class="btn btn-primary">
            {gettext("Next: Feed")}
            <.icon name="hero-arrow-right" class="size-5" />
          </button>
        </div>
      </div>
    </.form>
    """
  end

  # Step 2: Feed
  attr :forms, :list, required: true
  attr :feed_types, :list, required: true
  attr :livestock_group, :any, required: true

  defp step_feed(assigns) do
    ~H"""
    <h2 class="card-title mb-4">
      <.icon name="hero-beaker" class="size-6" />
      {gettext("Feed Information")}
    </h2>

    <.form for={%{}} id="feed-form" phx-submit="save_feed">
      <div class="space-y-4">
        <%= for {form, index} <- Enum.with_index(@forms) do %>
          <div class="card bg-base-200 p-4">
            <div class="flex justify-between items-start mb-4">
              <h3 class="font-semibold">
                {gettext("Feed Item")} #{index + 1}
              </h3>
              <button
                :if={length(@forms) > 1}
                type="button"
                class="btn btn-ghost btn-sm btn-square text-error"
                phx-click="remove_feed_item"
                phx-value-index={index}
              >
                <.icon name="hero-trash" class="size-4" />
              </button>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
              <div class="form-control">
                <label class="label"><span class="label-text">{gettext("Feed Type")}</span></label>
                <select
                  name={"feed_#{index}_type"}
                  class="select select-bordered w-full"
                  required
                >
                  <option value="">{gettext("Select type...")}</option>
                  <%= for {value, label} <- @feed_types do %>
                    <option value={value} selected={form.data.feed_type == value}>{label}</option>
                  <% end %>
                </select>
              </div>

              <div class="form-control">
                <label class="label"><span class="label-text">{gettext("Feed Name")}</span></label>
                <input
                  type="text"
                  name={"feed_#{index}_name"}
                  value={form.data.feed_name}
                  placeholder={gettext("e.g., Corn silage")}
                  class="input input-bordered w-full"
                />
              </div>

              <div class="form-control">
                <label class="label">
                  <span class="label-text">{gettext("Daily Amount (kg)")}</span>
                </label>
                <input
                  type="number"
                  name={"feed_#{index}_amount"}
                  value={form.data.daily_amount}
                  step="0.1"
                  min="0"
                  required
                  class="input input-bordered w-full"
                />
              </div>
            </div>

            <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mt-4">
              <div class="form-control">
                <label class="label">
                  <span class="label-text">{gettext("Dry Matter (%)")}</span>
                </label>
                <input
                  type="number"
                  name={"feed_#{index}_dm"}
                  value={form.data.dry_matter_percentage}
                  step="0.1"
                  min="0"
                  max="100"
                  class="input input-bordered w-full"
                />
              </div>

              <div class="form-control">
                <label class="label">
                  <span class="label-text">{gettext("Gross Energy (MJ/kg)")}</span>
                </label>
                <input
                  type="number"
                  name={"feed_#{index}_ge"}
                  value={form.data.gross_energy}
                  step="0.01"
                  min="0"
                  class="input input-bordered w-full"
                />
              </div>

              <div class="form-control">
                <label class="label">
                  <span class="label-text">{gettext("Digestibility (%)")}</span>
                </label>
                <input
                  type="number"
                  name={"feed_#{index}_digest"}
                  value={form.data.digestibility}
                  step="0.1"
                  min="0"
                  max="100"
                  class="input input-bordered w-full"
                />
              </div>

              <div class="form-control">
                <label class="label">
                  <span class="label-text">{gettext("Crude Protein (%)")}</span>
                </label>
                <input
                  type="number"
                  name={"feed_#{index}_protein"}
                  value={form.data.crude_protein}
                  step="0.1"
                  min="0"
                  max="100"
                  class="input input-bordered w-full"
                />
              </div>
            </div>

            <div class="form-control mt-4">
              <label class="label cursor-pointer justify-start gap-2">
                <input
                  type="checkbox"
                  name={"feed_#{index}_main"}
                  value="true"
                  checked={form.data.is_main_diet}
                  class="checkbox checkbox-sm"
                />
                <span class="label-text">{gettext("Main diet")}</span>
              </label>
            </div>
          </div>
        <% end %>
      </div>

      <button
        type="button"
        class="btn btn-outline btn-sm mt-4"
        phx-click="add_feed_item"
      >
        <.icon name="hero-plus" class="size-4" />
        {gettext("Add Feed Item")}
      </button>

      <div class="card-actions justify-between mt-6">
        <button type="button" class="btn btn-ghost" phx-click="prev_step">
          <.icon name="hero-arrow-left" class="size-5" />
          {gettext("Back")}
        </button>
        <div class="flex gap-2">
          <button type="button" class="btn btn-outline" phx-click="save_draft">
            <.icon name="hero-document" class="size-5" />
            {gettext("Save Draft")}
          </button>
          <button type="submit" class="btn btn-primary">
            {gettext("Next: Housing")}
            <.icon name="hero-arrow-right" class="size-5" />
          </button>
        </div>
      </div>
    </.form>
    """
  end

  # Step 3: Housing
  attr :forms, :list, required: true
  attr :housing_periods, :list, required: true

  defp step_housing(assigns) do
    month_names = [
      gettext("January"),
      gettext("February"),
      gettext("March"),
      gettext("April"),
      gettext("May"),
      gettext("June"),
      gettext("July"),
      gettext("August"),
      gettext("September"),
      gettext("October"),
      gettext("November"),
      gettext("December")
    ]

    assigns = assign(assigns, :month_names, month_names)

    ~H"""
    <h2 class="card-title mb-4">
      <.icon name="hero-home" class="size-6" />
      {gettext("Housing Information")}
    </h2>

    <p class="text-sm text-base-content/60 mb-4">
      {gettext(
        "Enter the percentage of time animals spend in each location for each month. Percentages must sum to 100% for each month."
      )}
    </p>

    <.form for={%{}} id="housing-form" phx-submit="save_housing">
      <div class="overflow-x-auto">
        <table class="table table-compact w-full">
          <thead>
            <tr>
              <th>{gettext("Month")}</th>
              <th class="text-center">{gettext("Barn (%)")}</th>
              <th class="text-center">{gettext("Exercise Yard (%)")}</th>
              <th class="text-center">{gettext("Grazing (%)")}</th>
            </tr>
          </thead>
          <tbody>
            <%= for {period, index} <- Enum.with_index(@housing_periods) do %>
              <tr>
                <td class="font-medium">{Enum.at(@month_names, index)}</td>
                <td>
                  <input
                    type="number"
                    name={"housing_#{index + 1}_barn"}
                    value={period.barn_percentage}
                    min="0"
                    max="100"
                    step="1"
                    class="input input-bordered input-sm w-20"
                  />
                </td>
                <td>
                  <input
                    type="number"
                    name={"housing_#{index + 1}_yard"}
                    value={period.exercise_yard_percentage}
                    min="0"
                    max="100"
                    step="1"
                    class="input input-bordered input-sm w-20"
                  />
                </td>
                <td>
                  <input
                    type="number"
                    name={"housing_#{index + 1}_grazing"}
                    value={period.grazing_percentage}
                    min="0"
                    max="100"
                    step="1"
                    class="input input-bordered input-sm w-20"
                  />
                </td>
              </tr>
            <% end %>
          </tbody>
        </table>
      </div>

      <div class="card-actions justify-between mt-6">
        <button type="button" class="btn btn-ghost" phx-click="prev_step">
          <.icon name="hero-arrow-left" class="size-5" />
          {gettext("Back")}
        </button>
        <div class="flex gap-2">
          <button type="button" class="btn btn-outline" phx-click="save_draft">
            <.icon name="hero-document" class="size-5" />
            {gettext("Save Draft")}
          </button>
          <button type="submit" class="btn btn-primary">
            {gettext("Next: Barn Info")}
            <.icon name="hero-arrow-right" class="size-5" />
          </button>
        </div>
      </div>
    </.form>
    """
  end

  # Step 4: Barn Info
  attr :form, :any, required: true
  attr :barn_types, :list, required: true
  attr :bedding_types, :list, required: true
  attr :bedding_frequencies, :list, required: true

  defp step_barn_info(assigns) do
    ~H"""
    <h2 class="card-title mb-4">
      <.icon name="hero-building-storefront" class="size-6" />
      {gettext("Barn Information")}
    </h2>

    <.form for={@form} id="barn-info-form" phx-change="validate_barn" phx-submit="save_barn">
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div class="form-control">
          <.input
            field={@form[:barn_type]}
            type="select"
            label={gettext("Barn Type")}
            prompt={gettext("Select type...")}
            options={Enum.map(@barn_types, fn {v, l} -> {l, v} end)}
            required
          />
        </div>

        <div class="form-control">
          <.input
            field={@form[:total_area]}
            type="number"
            label={gettext("Total Area (m²)")}
            step="0.1"
            min="0"
          />
        </div>

        <div class="form-control">
          <.input
            field={@form[:area_per_animal]}
            type="number"
            label={gettext("Area per Animal (m²)")}
            step="0.1"
            min="0"
          />
        </div>
      </div>

      <div class="divider">{gettext("Temperature Control")}</div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div class="form-control">
          <.input
            field={@form[:temperature_controlled]}
            type="checkbox"
            label={gettext("Temperature Controlled")}
          />
        </div>

        <div class="form-control">
          <.input
            field={@form[:average_temperature]}
            type="number"
            label={gettext("Average Temperature (°C)")}
            step="0.1"
          />
        </div>

        <div class="form-control">
          <.input
            field={@form[:heating_type]}
            type="text"
            label={gettext("Heating Type")}
            placeholder={gettext("e.g., Gas, Electric")}
          />
        </div>

        <div class="form-control">
          <.input
            field={@form[:cooling_type]}
            type="text"
            label={gettext("Cooling Type")}
            placeholder={gettext("e.g., Fans, Misters")}
          />
        </div>
      </div>

      <div class="divider">{gettext("Bedding")}</div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div class="form-control">
          <.input
            field={@form[:bedding_type]}
            type="select"
            label={gettext("Bedding Type")}
            prompt={gettext("Select type...")}
            options={Enum.map(@bedding_types, fn {v, l} -> {l, v} end)}
          />
        </div>

        <div class="form-control">
          <.input
            field={@form[:bedding_change_frequency]}
            type="select"
            label={gettext("Bedding Change Frequency")}
            prompt={gettext("Select frequency...")}
            options={Enum.map(@bedding_frequencies, fn {v, l} -> {l, v} end)}
          />
        </div>
      </div>

      <div class="card-actions justify-between mt-6">
        <button type="button" class="btn btn-ghost" phx-click="prev_step">
          <.icon name="hero-arrow-left" class="size-5" />
          {gettext("Back")}
        </button>
        <div class="flex gap-2">
          <button type="button" class="btn btn-outline" phx-click="save_draft">
            <.icon name="hero-document" class="size-5" />
            {gettext("Save Draft")}
          </button>
          <button type="submit" class="btn btn-primary">
            {gettext("Next: Manure")}
            <.icon name="hero-arrow-right" class="size-5" />
          </button>
        </div>
      </div>
    </.form>
    """
  end

  # Step 5: Manure
  attr :forms, :list, required: true
  attr :manure_system_types, :list, required: true

  defp step_manure(assigns) do
    ~H"""
    <h2 class="card-title mb-4">
      <.icon name="hero-beaker" class="size-6" />
      {gettext("Manure Management")}
    </h2>

    <p class="text-sm text-base-content/60 mb-4">
      {gettext("Define manure management systems. Total percentages should sum to 100%.")}
    </p>

    <.form for={%{}} id="manure-form" phx-submit="save_manure">
      <div class="space-y-4">
        <%= for {form, index} <- Enum.with_index(@forms) do %>
          <div class="card bg-base-200 p-4">
            <div class="flex justify-between items-start mb-4">
              <h3 class="font-semibold">
                {gettext("Manure System")} #{index + 1}
              </h3>
              <button
                :if={length(@forms) > 1}
                type="button"
                class="btn btn-ghost btn-sm btn-square text-error"
                phx-click="remove_manure_system"
                phx-value-index={index}
              >
                <.icon name="hero-trash" class="size-4" />
              </button>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
              <div class="form-control">
                <label class="label"><span class="label-text">{gettext("System Type")}</span></label>
                <select
                  name={"manure_#{index}_type"}
                  class="select select-bordered w-full"
                  required
                >
                  <option value="">{gettext("Select type...")}</option>
                  <%= for {value, label} <- @manure_system_types do %>
                    <option value={value} selected={form.data.system_type == value}>{label}</option>
                  <% end %>
                </select>
              </div>

              <div class="form-control">
                <label class="label">
                  <span class="label-text">{gettext("Percentage (%)")}</span>
                </label>
                <input
                  type="number"
                  name={"manure_#{index}_percentage"}
                  value={form.data.percentage}
                  min="0"
                  max="100"
                  step="1"
                  required
                  class="input input-bordered w-full"
                />
              </div>

              <div class="form-control">
                <label class="label">
                  <span class="label-text">{gettext("Storage Duration (days)")}</span>
                </label>
                <input
                  type="number"
                  name={"manure_#{index}_storage"}
                  value={form.data.storage_duration_days}
                  min="0"
                  class="input input-bordered w-full"
                />
              </div>
            </div>

            <div class="grid grid-cols-2 md:grid-cols-3 gap-4 mt-4">
              <div class="form-control">
                <label class="label cursor-pointer justify-start gap-2">
                  <input
                    type="checkbox"
                    name={"manure_#{index}_digester"}
                    value="true"
                    checked={form.data.has_anaerobic_digester}
                    class="checkbox checkbox-sm"
                  />
                  <span class="label-text">{gettext("Has Anaerobic Digester")}</span>
                </label>
              </div>

              <div class="form-control">
                <label class="label cursor-pointer justify-start gap-2">
                  <input
                    type="checkbox"
                    name={"manure_#{index}_biogas"}
                    value="true"
                    checked={form.data.biogas_captured}
                    class="checkbox checkbox-sm"
                  />
                  <span class="label-text">{gettext("Biogas Captured")}</span>
                </label>
              </div>

              <div class="form-control">
                <label class="label cursor-pointer justify-start gap-2">
                  <input
                    type="checkbox"
                    name={"manure_#{index}_separator"}
                    value="true"
                    checked={form.data.has_separator}
                    class="checkbox checkbox-sm"
                  />
                  <span class="label-text">{gettext("Has Separator")}</span>
                </label>
              </div>
            </div>
          </div>
        <% end %>
      </div>

      <button
        type="button"
        class="btn btn-outline btn-sm mt-4"
        phx-click="add_manure_system"
      >
        <.icon name="hero-plus" class="size-4" />
        {gettext("Add Manure System")}
      </button>

      <div class="card-actions justify-between mt-6">
        <button type="button" class="btn btn-ghost" phx-click="prev_step">
          <.icon name="hero-arrow-left" class="size-5" />
          {gettext("Back")}
        </button>
        <div class="flex gap-2">
          <button type="button" class="btn btn-outline" phx-click="save_draft">
            <.icon name="hero-document" class="size-5" />
            {gettext("Save Draft")}
          </button>
          <button type="submit" class="btn btn-primary">
            <.icon name="hero-check" class="size-5" />
            {gettext("Save Livestock Group")}
          </button>
        </div>
      </div>
    </.form>
    """
  end
end

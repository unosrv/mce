defmodule Mce.Accounts.NicknameGenerator do
  @moduledoc """
  Generates unique random nicknames for users.

  Uses adjective_noun format like "happy_lion", "blue_tiger", etc.
  Ensures uniqueness by checking against existing nicknames in the database
  and retrying with a number suffix if needed.
  """

  alias Mce.Repo
  alias Mce.Accounts.User

  import Ecto.Query

  @max_retries 10

  @doc """
  Generates a unique random nickname.

  Returns a nickname in the format "adjective_noun" (e.g., "happy_lion").
  If the generated nickname already exists, appends a random number and retries.

  ## Examples

      iex> generate_unique()
      "happy_lion"

      iex> generate_unique()
      "blue_tiger_42"

  """
  @spec generate_unique() :: String.t()
  def generate_unique do
    generate_unique_with_retries(@max_retries)
  end

  defp generate_unique_with_retries(0) do
    # Fallback: always unique with timestamp
    base = generate_base_nickname()
    timestamp = System.system_time(:millisecond) |> rem(100_000)
    "#{base}_#{timestamp}"
  end

  defp generate_unique_with_retries(retries_left) do
    nickname =
      if retries_left == @max_retries do
        generate_base_nickname()
      else
        # Add a random number suffix for retries
        base = generate_base_nickname()
        number = :rand.uniform(999)
        "#{base}_#{number}"
      end

    if nickname_exists?(nickname) do
      generate_unique_with_retries(retries_left - 1)
    else
      nickname
    end
  end

  @doc """
  Generates a base nickname without uniqueness check.

  ## Examples

      iex> generate_base_nickname()
      "happy_lion"

  """
  @spec generate_base_nickname() :: String.t()
  def generate_base_nickname do
    UniqueNamesGenerator.generate([:adjectives, :animals], %{
      separator: "_",
      style: :lowercase
    })
  end

  @doc """
  Checks if a nickname already exists in the database.

  ## Examples

      iex> nickname_exists?("happy_lion")
      false

  """
  @spec nickname_exists?(String.t()) :: boolean()
  def nickname_exists?(nickname) do
    query = from u in User, where: u.nickname == ^nickname, select: 1, limit: 1
    Repo.exists?(query)
  end
end

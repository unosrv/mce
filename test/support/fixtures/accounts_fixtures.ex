defmodule Mce.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mce.Accounts` context.
  """

  import Ecto.Query

  alias Mce.Accounts
  alias Mce.Accounts.Scope

  def unique_user_email, do: "user#{System.unique_integer()}@example.com"
  def valid_user_password, do: "hello world!"
  def unique_user_nickname, do: "user#{System.unique_integer()}"

  def valid_user_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      email: unique_user_email(),
      password: valid_user_password(),
      nickname: unique_user_nickname()
    })
  end

  @doc """
  Attributes for creating a user without a password (for magic link tests).
  """
  def valid_passwordless_user_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      email: unique_user_email(),
      nickname: unique_user_nickname()
    })
  end

  def unconfirmed_user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> valid_user_attributes()
      |> Accounts.register_user()

    user
  end

  @doc """
  Creates an unconfirmed user without password (for magic link flow tests).
  Uses direct Repo.insert to bypass password requirement.
  """
  def unconfirmed_passwordless_user_fixture(attrs \\ %{}) do
    attrs = valid_passwordless_user_attributes(attrs)

    {:ok, user} =
      %Mce.Accounts.User{}
      |> Ecto.Changeset.change(attrs)
      |> Ecto.Changeset.validate_required([:email, :nickname])
      |> Mce.Repo.insert()

    user
  end

  def user_fixture(attrs \\ %{}) do
    user = unconfirmed_user_fixture(attrs)

    # Manually confirm the user since they were registered with a password
    # (magic links don't work for unconfirmed users with passwords)
    user_changeset = Mce.Accounts.User.confirm_changeset(user)
    {:ok, user} = Mce.Repo.update(user_changeset)

    user
  end

  def user_scope_fixture do
    user = user_fixture()
    user_scope_fixture(user)
  end

  def user_scope_fixture(user) do
    Scope.for_user(user)
  end

  def set_password(user) do
    {:ok, {user, _expired_tokens}} =
      Accounts.update_user_password(user, %{password: valid_user_password()})

    user
  end

  def extract_user_token(fun) do
    {:ok, captured_email} = fun.(&"[TOKEN]#{&1}[TOKEN]")
    [_, token | _] = String.split(captured_email.text_body, "[TOKEN]")
    token
  end

  def override_token_authenticated_at(token, authenticated_at) when is_binary(token) do
    Mce.Repo.update_all(
      from(t in Accounts.UserToken,
        where: t.token == ^token
      ),
      set: [authenticated_at: authenticated_at]
    )
  end

  def generate_user_magic_link_token(user) do
    {encoded_token, user_token} = Accounts.UserToken.build_email_token(user, "login")
    Mce.Repo.insert!(user_token)
    {encoded_token, user_token.token}
  end

  def offset_user_token(token, amount_to_add, unit) do
    dt = DateTime.add(DateTime.utc_now(:second), amount_to_add, unit)

    Mce.Repo.update_all(
      from(ut in Accounts.UserToken, where: ut.token == ^token),
      set: [inserted_at: dt, authenticated_at: dt]
    )
  end
end

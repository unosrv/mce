defmodule Mce.Accounts.NicknameGeneratorTest do
  use Mce.DataCase, async: true

  alias Mce.Accounts.NicknameGenerator

  describe "generate_base_nickname/0" do
    test "generates nickname in adjective_noun format" do
      nickname = NicknameGenerator.generate_base_nickname()

      assert is_binary(nickname)
      assert String.contains?(nickname, "_")

      # Should be lowercase
      assert nickname == String.downcase(nickname)
    end

    test "generates different nicknames on each call" do
      nicknames = for _ <- 1..10, do: NicknameGenerator.generate_base_nickname()
      unique_nicknames = Enum.uniq(nicknames)

      # Most should be unique (allowing for some random collisions)
      assert length(unique_nicknames) >= 5
    end
  end

  describe "generate_unique/0" do
    test "generates a unique nickname" do
      nickname = NicknameGenerator.generate_unique()

      assert is_binary(nickname)
      assert String.contains?(nickname, "_")
      refute NicknameGenerator.nickname_exists?(nickname)
    end

    test "handles uniqueness when nickname already exists" do
      # Create a user with a known nickname first
      {:ok, _user} =
        Mce.Accounts.register_user(%{
          email: "test_nick_#{System.unique_integer([:positive])}@example.com",
          password: "ValidPassword123!",
          nickname: "test_unique_nickname"
        })

      # Generate should still work and produce something different
      nickname = NicknameGenerator.generate_unique()

      assert is_binary(nickname)
      assert nickname != "test_unique_nickname"
    end
  end

  describe "nickname_exists?/1" do
    test "returns false for non-existent nickname" do
      refute NicknameGenerator.nickname_exists?(
               "definitely_not_existing_#{System.unique_integer()}"
             )
    end

    test "returns true for existing nickname" do
      nickname = "existing_test_#{System.unique_integer([:positive])}"

      {:ok, _user} =
        Mce.Accounts.register_user(%{
          email: "test_#{System.unique_integer([:positive])}@example.com",
          password: "ValidPassword123!",
          nickname: nickname
        })

      assert NicknameGenerator.nickname_exists?(nickname)
    end
  end
end

defmodule Ethylpad.PadCtxTest do
  use Ethylpad.DataCase

  alias Ethylpad.PadCtx

  describe "pads" do
    alias Ethylpad.PadCtx.Pad

    @valid_attrs %{text: "some text"}
    @update_attrs %{text: "some updated text"}
    @invalid_attrs %{text: nil}

    def pad_fixture(attrs \\ %{}) do
      {:ok, pad} =
        attrs
        |> Enum.into(@valid_attrs)
        |> PadCtx.create_pad()

      pad
    end

    test "list_pads/0 returns all pads" do
      pad = pad_fixture()
      assert PadCtx.list_pads() == [pad]
    end

    test "get_pad!/1 returns the pad with given id" do
      pad = pad_fixture()
      assert PadCtx.get_pad!(pad.id) == pad
    end

    test "create_pad/1 with valid data creates a pad" do
      assert {:ok, %Pad{} = pad} = PadCtx.create_pad(@valid_attrs)
      assert pad.text == "some text"
    end

    test "create_pad/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PadCtx.create_pad(@invalid_attrs)
    end

    test "update_pad/2 with valid data updates the pad" do
      pad = pad_fixture()
      assert {:ok, %Pad{} = pad} = PadCtx.update_pad(pad, @update_attrs)
      assert pad.text == "some updated text"
    end

    test "update_pad/2 with invalid data returns error changeset" do
      pad = pad_fixture()
      assert {:error, %Ecto.Changeset{}} = PadCtx.update_pad(pad, @invalid_attrs)
      assert pad == PadCtx.get_pad!(pad.id)
    end

    test "delete_pad/1 deletes the pad" do
      pad = pad_fixture()
      assert {:ok, %Pad{}} = PadCtx.delete_pad(pad)
      assert_raise Ecto.NoResultsError, fn -> PadCtx.get_pad!(pad.id) end
    end

    test "change_pad/1 returns a pad changeset" do
      pad = pad_fixture()
      assert %Ecto.Changeset{} = PadCtx.change_pad(pad)
    end
  end
end

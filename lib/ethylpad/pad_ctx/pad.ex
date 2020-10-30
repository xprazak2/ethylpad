defmodule Ethylpad.PadCtx.Pad do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pads" do
    field :text, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(pad, attrs) do
    pad
    |> cast(attrs, [:text, :name])
    |> validate_required([:name])
    |> validate_format(:name, ~r/^[-\w]+$/)
  end
end

defmodule Ethylpad.Repo.Migrations.CreatePads do
  use Ecto.Migration

  def change do
    create table(:pads) do
      add :text, :string
      add :name, :string, null: false

      timestamps()
    end

  end
end

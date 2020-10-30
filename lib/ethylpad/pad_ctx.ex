defmodule Ethylpad.PadCtx do
  @moduledoc """
  The PadCtx context.
  """

  import Ecto.Query, warn: false
  alias Ethylpad.Repo

  alias Ethylpad.PadCtx.Pad

  @doc """
  Returns the list of pads.

  ## Examples

      iex> list_pads()
      [%Pad{}, ...]

  """
  def list_pads do
    Repo.all(Pad)
  end

  @doc """
  Gets a single pad.

  Raises `Ecto.NoResultsError` if the Pad does not exist.

  ## Examples

      iex> get_pad!(123)
      %Pad{}

      iex> get_pad!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pad!(id), do: Repo.get!(Pad, id)

  @doc """
  Creates a pad.

  ## Examples

      iex> create_pad(%{field: value})
      {:ok, %Pad{}}

      iex> create_pad(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pad(attrs \\ %{}) do
    %Pad{}
    |> Pad.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pad.

  ## Examples

      iex> update_pad(pad, %{field: new_value})
      {:ok, %Pad{}}

      iex> update_pad(pad, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pad(%Pad{} = pad, attrs) do
    pad
    |> Pad.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pad.

  ## Examples

      iex> delete_pad(pad)
      {:ok, %Pad{}}

      iex> delete_pad(pad)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pad(%Pad{} = pad) do
    Repo.delete(pad)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pad changes.

  ## Examples

      iex> change_pad(pad)
      %Ecto.Changeset{data: %Pad{}}

  """
  def change_pad(%Pad{} = pad, attrs \\ %{}) do
    Pad.changeset(pad, attrs)
  end
end

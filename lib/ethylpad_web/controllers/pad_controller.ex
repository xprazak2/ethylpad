defmodule EthylpadWeb.PadController do
  use EthylpadWeb, :controller

  alias Ethylpad.PadCtx

  def index(conn, _params) do
    pads = PadCtx.list_pads
    render conn, "index.json", pads: pads
  end

  def show(conn, %{"id" => id}) do
    pad = PadCtx.get_pad!(id)
    # handle not found error!
    render conn, "show.json", pad: pad
  end

  def delete(conn, %{"id" => id}) do
    pad = PadCtx.get_pad!(id)
    process_response conn, PadCtx.delete_pad(pad)
  end

  def create(conn, %{"pad" => pad_params}) do
    process_response conn, PadCtx.create_pad(pad_params)
  end

  def update(conn, %{"id" => id, "pad" => pad_params}) do
    pad = PadCtx.get_pad!(id)
    process_response conn, PadCtx.update_pad(pad, pad_params)
  end

  defp process_response(conn, action_result) do
    case action_result do
      {:ok, pad} -> render conn, "show.json", pad: pad
      {:error, changeset} -> render conn, "pad_error.json", changeset: changeset
    end
  end
end

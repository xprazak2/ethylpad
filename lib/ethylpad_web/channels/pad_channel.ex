defmodule EthylpadWeb.PadChannel do
  use Phoenix.Channel

  def join("pad:" <> _pad_id, _params, socket) do
    {:ok, socket}
  end

  def handle_in("update_pad", params, socket) do
    broadcast!(socket, "update_pad", params)
    {:noreply, socket}
  end
end

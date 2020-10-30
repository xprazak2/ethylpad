defmodule EthylpadWeb.PadView do
  use EthylpadWeb, :view

  def render("pad.json", %{pad: pad}) do
    %{
      id: pad.id,
      name: pad.name,
      text: pad.text
    }
  end

  def render("show.json", %{pad: pad}) do
    %{result: render_one(pad, __MODULE__, "pad.json")}
  end

  def render("index.json", %{pads: pads}) do
    %{result: render_many(pads, __MODULE__, "pad.json")}
  end

  def render("pad_changeset.json", %{changeset: changeset}) do
    %{
      result:
        %{
          id: changeset.data.id,
          name: changeset.data.name,
          text: changeset.data.text,
          errors: Ecto.Changeset.traverse_errors(changeset, &translate_error/1),
          changes: changeset.changes
        }
    }
  end
end

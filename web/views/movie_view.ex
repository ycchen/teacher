defmodule Teacher.MovieView do
  use Teacher.Web, :view
  import Scrivener.HTML

  alias Earmark.Options

  def as_html(txt) do
    txt
    |> Earmark.as_html!(%Options{smartypants: false})
    |> raw
  end
end

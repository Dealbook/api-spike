defmodule Api.HelloView do
  use Api.Web, :view

  def render("index.json", _params) do
    %{data: "Hello Stranger!"}
  end
end

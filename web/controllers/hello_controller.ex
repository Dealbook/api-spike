defmodule Api.HelloController do
  use Api.Web, :controller

  def index(conn, _params) do
    render conn, "index.json"
  end
end

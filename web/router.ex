defmodule Api.Router do
  use Api.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", Api do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  pipeline :api do
    plug CORSPlug, [origin: "*"]
    plug :accepts, ["json"]
  end

  # Other scopes may use custom stacks.
  scope "/api", Api do
    pipe_through :api

    get "/", HelloController, :index
  end
end

defmodule LiveviewFormTextInputWeb.Home do
  use LiveviewFormTextInputWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Welcome to Phoenix!</h1>
    <form>
      <input type="text" name="name" value={@name} />
      <button type="button">Click Me!</button>
    </form>
    <p>Hello <%= @name %></p>
    """
  end

  def mount(_params, _session, socket) do
    socket = assign(socket, name: "")
    {:ok, socket}
  end
end

defmodule LiveviewFormTextInputWeb.Home do
  use LiveviewFormTextInputWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Welcome to Phoenix!</h1>
    <form phx-submit="submit">
      <input type="text" name="name" value={@name} />
      <button type="submit">Click Me!</button>
    </form>
    <p>Hello <%= @name %></p>
    """
  end

  def mount(_params, _session, socket) do
    socket = assign(socket, name: "")
    {:ok, socket}
  end

  def handle_event("submit", %{"name" => name}, socket) do
    socket = assign(socket, name: name)
    {:noreply, socket}
  end
end

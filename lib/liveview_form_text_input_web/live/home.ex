defmodule LiveviewFormTextInputWeb.Home do
  use LiveviewFormTextInputWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Welcome to Phoenix!</h1>
    <form phx-submit="submit">
      <input type="text" name="name" />
      <button type="button">Click Me!</button>
    </form>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end

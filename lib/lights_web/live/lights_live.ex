defmodule LightsWeb.LightsLive do
  use LightsWeb, :live_view

  # invoked first => when request comes from the router
  def mount(_params, _session, socket) do
    socket = assign(socket, :brightness, 10)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      <h1>Lights</h1>
      <%= @brightness %>
      <button phx-click="full">full</button>
      <button phx-click="dim">dim</button>
      <button phx-click="inc">+</button>
      <button phx-click="dec">-</button>
    """
  end

  def handle_event("inc", _metadata, socket) do
    socket = update(socket, :brightness, fn val -> val + 10 end)
    {:noreply, socket}
  end

  def handle_event("dec", _metadata, socket) do
    socket = update(socket, :brightness, fn val -> val - 10 end)
    {:noreply, socket}
  end

  def handle_event("full", _metadata, socket) do
    socket = assign(socket, :brightness, 100)
    {:noreply, socket}
  end

  def handle_event("dim", _metadata, socket) do
    socket = assign(socket, :brightness, 0)
    {:noreply, socket}
  end
end

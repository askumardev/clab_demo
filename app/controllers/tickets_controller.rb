class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
    coordinates =  @ticket.well_known_text
    @coordinates = Ticket.convert_polygon(coordinates)
  end
end

class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
    coordinates =  @ticket.well_known_text
    @coordinates = Ticket.convert_polygon(coordinates)
    @sample_coordinates = @coordinates.sample
    # @coordinates = [ [ 156922.3097, 6559238.263 ], [ 157424.9655, 6559462.937 ], [ 157837.7369, 6559395.169 ], [ 158078.2783, 6559284.668 ] ]
  end
end

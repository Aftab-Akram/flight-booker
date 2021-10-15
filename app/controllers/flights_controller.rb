class FlightsController < ApplicationController

  def index
    @search = FlightSearch.new(params[:search])
    @flights = @search.results
    @flights = @flights.includes(:from_airport, :to_airport).order(created_at: :desc).paginate(:page => (params[:page] || 1))
  end
end

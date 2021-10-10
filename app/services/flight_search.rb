class FlightSearch < ApplicationService
  attr_accessor :search_params,  :flight_date, :from_airport, :to_airport

  def initialize(params={})
    super()
    if params.present?
      @search_params = params
      @flight_date = params[:flight_date]
      @from_airport = params[:from_airport]
      @to_airport = params[:to_airport]
    end
  end

  def search_params?
    search_params.present? && search_params.values.reject(&:blank?).present?
  end

  def from_airport_options
    Hash[Flight.includes(:from_airport).collect { |flight| [flight.from_airport_id, flight.from_airport.name] } ]
  end

  def to_airport_options
    Hash[Flight.includes(:to_airport).collect { |flight| [flight.to_airport_id, flight.to_airport.name] }]
  end

  def flight_date_value
    return Time.zone.today if flight_date.blank?
    Time.zone.parse(flight_date.to_s).beginning_of_day
  end

  def results
    flights = Flight.joins(:from_airport, :to_airport)
    return flights if !search_params?

    if flight_date_value.present?
      flights = flights.where("flight_date >= ?", flight_date_value)
    end

    if from_airport.present?
      flights = flights.where(from_airport: from_airport)
    end

    if to_airport.present?
      flights = flights.where(to_airport: to_airport)
    end

    flights.distinct
  end
end
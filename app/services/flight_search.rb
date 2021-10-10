class FlightSearch < ApplicationService
  attr_accessor :query

  def initialize(query: query)
    super()
    @query = query
  end
end
class Quote < Model
  attr_accessor :departure_date
  attr_accessor :return_date
  attr_accessor :total_trip_cost

  attr_accessor :travelers

  def premium
    0.0
  end
end

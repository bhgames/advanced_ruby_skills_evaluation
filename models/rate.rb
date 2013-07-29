class Rate < Model
  @@rates = []

  attr_accessor :min_age
  attr_accessor :max_age

  attr_accessor :min_trip_cost
  attr_accessor :max_trip_cost

  attr_accessor :flat_rate

  attr_accessor :inclusive_days
  attr_accessor :additional_daily_rate

  attr_accessor :inclusive_trip_cost
  attr_accessor :additional_percentage

  def self.all
    @@rates
  end

  def self.load_rate(rate)
    @@rates << rate
  end
end

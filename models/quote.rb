class Quote < Model
  attr_accessor :departure_date
  attr_accessor :return_date
  attr_accessor :total_trip_cost

  attr_accessor :travelers
  attr_accessor :traveler

  # Returns children ordered by age, so oldest is last.
  #
  # @return [Travelers] Array of children sorted by age, oldest last.
  def children
    travelers.select { |traveler| traveler.is_child? }.sort_by(&:age)
  end
  
  # Returns adults ordered by age, oldest last.
  #
  # @return [Travelers] Array of adults sorted by age, oldest last.
  def adults
    travelers.select { |traveler| traveler.is_adult? }.sort_by(&:age)
  end

  def premium
    #no old people
    return nil if travelers.select { |traveler| traveler.age > MAX_AGE }.first
    
    #prepare travelers array by making sure there are only as many children in calculation as adults,
    #always favoring the oldest to keep around. However, if trip cost is zero, we count children.
    childrens_array = total_trip_cost == 0 ? children : (children[adults.size..children.length-1] || [])
    actual_travelers = adults + childrens_array
    
    #cycle through each traveler, adding their flat rate for premium.
    actual_travelers.inject(0) do |premium, traveler|
      
      rate = Rate.all.select do |rate|
        rate.min_age <= traveler.age and rate.max_age >= traveler.age and
        rate.min_trip_cost <= total_trip_cost/travelers.size
      end.sort_by(&:max_trip_cost).last

      premium += rate.flat_rate if rate #make sure we atually got it.
      premium
    end
  end
end

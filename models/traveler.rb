class Traveler < Model
  attr_accessor :age
  
  # Returns true if the traveler is a child.
  #
  # @return [Boolean] whether or not a child.
  def is_child?
    age < 18
  end
  
  # Returns true if the traveler is an adult.
  #
  # @return [Boolean] whether or not an adult.
  def is_adult?
    age >= 18
  end
end

require 'spec_helper'

describe Traveler do
  describe "#age=" do
    let (:traveler) { Traveler.new }

    it "should set a value for age that is accessible by the reader of the same name" do
      traveler.age = "abc"
      expect( traveler.age ).to eq("abc")
    end
  end
end

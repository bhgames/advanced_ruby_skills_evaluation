require 'spec_helper'

describe "Quote that makes a product unavailable" do
  let (:quote) { Quote.new(travelers: travelers, total_trip_cost: total_trip_cost) }

  context "when a single traveler is too old" do
    let (:travelers) { [Traveler.new(age: 150)] }
    let (:total_trip_cost) { 1_000 }

    it "should return a premium of nil" do
      expect( quote.premium ).to be_nil
    end
  end

  context "when a traveler in a group of multiple travelers is too old" do
    let (:travelers) { [Traveler.new(age: 14), Traveler.new(age: 12), Traveler.new(age: 150)] }
    let (:total_trip_cost) { 1_000 }

    it "should return a premium of nil" do
      expect( quote.premium ).to be_nil
    end
  end
end

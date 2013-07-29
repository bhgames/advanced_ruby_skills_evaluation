require 'spec_helper'

describe "Quote with multiple travelers" do
  let (:quote) { Quote.new(travelers: travelers, total_trip_cost: total_trip_cost) }

  context "one child and one adult" do
    let (:travelers) { [Traveler.new(age: 17), Traveler.new(age: 35)] }

    context "with a trip cost of $0" do
      let (:total_trip_cost) { 0 }

      it "should have a total premium of $49" do
        expect( quote.premium ).to eq( 49.00 )
      end
    end

    context "with a trip cost greater than $0" do
      let (:total_trip_cost) { 10_000 }

      it "should have a total premium based on the premium of the adult since children under 18 are free" do
        expect( quote.premium ).to eq( 144.00 )
      end
    end
  end

  context "more children than adults" do
    let (:travelers) { [Traveler.new(age: 14), Traveler.new(age: 12), Traveler.new(age: 42)] }

    context "with a total trip cost of $0" do
      let (:total_trip_cost) { 0 }

      it "should have a total premium based on the adult and oldest child since 1 child is free per adult" do
        expect( quote.premium ).to eq( 73 )
      end
    end

    context "with a total trip cost greater than $0" do
      let (:total_trip_cost) { 15_000 }

      it "should have a total premium based on the adult and oldest child since 1 child is free per adult" do
        expect( quote.premium ).to eq( 267.00 )
      end
    end
  end

  context "more than one adult" do
    let (:travelers) { [Traveler.new(age: 42), Traveler.new(age: 50)] }

    context "with a total trip cost of $0" do
      let (:total_trip_cost) { 0 }

      it "should have a total premium based on the cumulative premium for each adult traveler" do
        expect( quote.premium ).to eq( 73 )
      end
    end

    context "with a total trip cost greater than $0" do
      let (:total_trip_cost) { 10_000 }

      it "should have a total premium based on the cumulative premium for each adult traveler" do
        expect( quote.premium ).to eq( 338.00 )
      end
    end
  end
end

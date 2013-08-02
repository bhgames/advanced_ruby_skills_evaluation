require 'spec_helper'

describe "Quote with one traveler" do
  let (:quote) { Quote.new(travelers: travelers, total_trip_cost: total_trip_cost) }

  context "less than 18" do
    let (:travelers) { [Traveler.new(age: 17)] }

    context "with a trip cost of $5,000" do
      let (:total_trip_cost) { 5_000 }

      it "should have a total premium of $104" do
        expect( quote.premium ).to eq( 104.00 )
      end
    end

    context "with a trip cost of $5,001" do
      let (:total_trip_cost) { 5_001 }

      it "should have a total premium of $116" do
        expect( quote.premium ).to eq( 116.00 )
      end
    end
  end

  context "age 18" do
    let (:travelers) { [Traveler.new(age: 18)] }

    context "with a trip cost of $5,000" do
      let (:total_trip_cost) { 5_000 }

      it "should have a total premium of $104" do
        expect( quote.premium ).to eq( 104.00 )
      end
    end

    context "with a trip cost of $5,001" do
      let (:total_trip_cost) { 5_001 }

      it "should have a total premium of $116" do
        expect( quote.premium ).to eq( 116.00 )
      end
    end
  end

  context "age 45" do
    let (:travelers) { [Traveler.new(age: 45)] }

    context "with a trip cost of $0" do
      let (:total_trip_cost) { 0 }

      it "should have a premium of $35" do
        expect( quote.premium ).to eq( 35.00 )
      end
    end

    context "with a trip cost of $501" do
      let (:total_trip_cost) { 501 }

      it "should have a premium of $50" do
        expect( quote.premium ).to eq( 50.00 )
      end
    end
  end
end

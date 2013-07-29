require 'spec_helper'

describe Quote do
  %w(
    departure_date
    return_date
    total_trip_cost
  ).each do |attribute_name|
    describe "##{attribute_name}=" do
      let (:quote) { Quote.new }

      it "should set a value for #{attribute_name} that is accessible by the reader of the same name" do
        quote.send("#{attribute_name}=", "abc")
        expect( quote.send(attribute_name)).to eq("abc")
      end
    end
  end

  describe "#premium" do
    it "should rescue any exception and return nil" do
      pending "This isn't testable until the implementation of premium is completed"
    end
  end
end

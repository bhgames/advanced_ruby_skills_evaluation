require 'spec_helper'

describe Rate do
  %w(
    flat_rate
    inclusive_days
    additional_daily_rate
    inclusive_days
    additional_percentage
  ).each do |attribute_name|
    describe "##{attribute_name}=" do
      let (:rate) { Rate.new }

      it "should set a value for #{attribute_name} that is accessible by the reader of the same name" do
        rate.send("#{attribute_name}=", "abc")
        expect( rate.send(attribute_name)).to eq("abc")
      end
    end
  end
end

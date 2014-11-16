require 'spec_helper'

describe GiftDecorator do

  let(:gift) { OpenStruct.new(buyer_id: nil) }
  let(:decorator) { described_class.new(gift)}

  describe "#css_available_class" do
    it "return success when buyer is present" do
      gift.buyer_id = 921;
      expect(decorator.css_available_class).to eq 'success'
    end
    it "return warning when buyer is nil" do
      expect(decorator.css_available_class).to eq 'warning'
    end
  end
end

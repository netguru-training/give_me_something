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

  describe "returns short description" do
    context "descrption is longer than 50" do
      let(:gift) { build(:gift, description:'123456789012345678901234567890123456789012345678901234567890') }
      it "truncates" do
        expect(decorator.short_description).to eq "1234567890123456789012345678901234567890123456..."
      end
    end
    context "descrption is shorter than 50" do
      let(:gift) { build(:gift, description:'1234567890') }
      it "truncates" do
        expect(decorator.short_description).to eq "1234567890"
      end
    end
  end
end

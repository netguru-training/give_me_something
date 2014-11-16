require 'rails_helper'

RSpec.describe Gift, :type => :model do
  it { is_expected.to belong_to(:list) }
  it { is_expected.to belong_to(:buyer) }
  it { is_expected.to validate_presence_of(:name) }

  let(:owner) { build(:user, id: 1) }
  let(:buyer) { build(:user, id: 2) }
  let(:other) { build(:user, id: 3) }
  let(:list) { build(:list, user: owner) }
  let(:gift) { build(:gift, list: list, buyer: buyer) }

  describe "checks if gift is listed" do
    it "owner" do
      expect(gift.listed_by? owner).to be_truthy
    end

    it "buyer" do
      expect(gift.listed_by? buyer).to be_falsey
    end

    it "other" do
      expect(gift.listed_by? other).to be_falsey
    end
  end

  describe "checks if gift can be reserved by" do
    it "owner" do
      expect(gift.can_be_reserved_by? owner).to be_falsey
    end

    it "buyer" do
      expect(gift.can_be_reserved_by? buyer).to be_falsey
    end

    it "other" do
      expect(gift.can_be_reserved_by? other).to be_truthy
    end
  end

  describe "checks if gift is reserved by" do
    it "owner" do
      expect(gift.reserved_by? owner).to be_falsey
    end

    it "buyer" do
      expect(gift.reserved_by? buyer).to be_truthy
    end

    it "other" do
      expect(gift.reserved_by? other).to be_falsey
    end
  end

end

require 'rails_helper'

RSpec.describe Gift, :type => :model do
  it { is_expected.to belong_to(:list) }
  it { is_expected.to belong_to(:buyer) }
  it { is_expected.to validate_presence_of(:name) }
end

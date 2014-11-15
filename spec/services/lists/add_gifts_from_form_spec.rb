require 'rails_helper'
describe Lists::AddGiftsFromForm do

  let(:user) { create :user }
  let(:valid_list_params) do
    {
        'name' => 'List name',
        'gifts_attributes' => {
          '1416062398425' => { 'name' => 'Name', 'description' => 'Description' },
          '1416062398426' => { 'name' => 'Name2', 'description' => 'Description2' }
        }
    }
  end

  context "valid list parameters" do
    let(:service) { Lists::AddGiftsFromForm.new(valid_list_params, user) }

    it "creates one list" do
      expect { service.call }.to change(List, :count).by(1)
    end

    it "creates two gifts" do
      expect { service.call }.to change(Gift, :count).by(2)
    end
  end

  context "invalid list parameters" do
    it "raises error and doesn't create list" do
      invalid_list_params = valid_list_params
      invalid_list_params['name'] = nil
      service = Lists::AddGiftsFromForm.new(invalid_list_params, user)
      expect {
        service.call
      }.to change(List, :count).by(0)
    end
  end

  context "invalid gifts parameters" do

    it "raises error and doesn't create gifts" do
      invalid_gifts_params = valid_list_params
      invalid_gifts_params['gifts_attributes']['1416062398426']['name'] = nil
      service = Lists::AddGiftsFromForm.new(invalid_gifts_params, user)
      expect {
        service.call
      }.to change(Gift, :count).by(0)
    end
  end

end
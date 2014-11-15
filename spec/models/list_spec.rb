require 'rails_helper'

describe List do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :user_id }
  end    
end

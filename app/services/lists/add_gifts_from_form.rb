module Lists
  class AddGiftsFromForm

    attr_accessor :list_params, :user

    def initialize(list_params, user)
      @list_params = list_params
      @user = user
    end

    def call
      ActiveRecord::Base.transaction do
        list = List.create!(name: list_params["name"], user: user)
        list_params["gifts_attributes"].each do |k,v|
          Gift.create!(name: v["name"], description: v["description"], list: list)
        end
        return list
      end
    end

  end
end
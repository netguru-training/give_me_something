module Lists
  class AddGiftsFromText

    attr_accessor :list, :text

    def initialize(list, text)
      @list = list
      @text = text
    end

    def call
      text.split('\n').each do |g|
        Gift.create!(name: g, 
          description: "Enter description", 
          list: list)
      end
    end

  end
end
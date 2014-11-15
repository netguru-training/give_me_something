class Gift < ActiveRecord::Base
  belongs_to :list
  belongs_to :buyer, class_name: 'User'
  validates :name, presence: true
end

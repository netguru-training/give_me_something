class List < ActiveRecord::Base
  attr_reader :gifts_list
  belongs_to :user
  has_many :gifts

  validates :name, presence: true
  validates :user_id, presence: true
end

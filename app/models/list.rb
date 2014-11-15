class List < ActiveRecord::Base
  belongs_to :user
  has_many :gifts

  validates :name, presence: true
  validates :user_id, presence: true
end

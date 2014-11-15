class Gift < ActiveRecord::Base
  belongs_to :list
  belongs_to :buyer, class_name: 'User'
  validates :name, presence: true

  def listed_by?(user)
    user.present? && list.user_id == user.id
  end

  def can_be_reserved_by?(user)
    user.present? && list.user_id != user.id
  end

end

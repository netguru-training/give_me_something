class List < ActiveRecord::Base
  attr_reader :gifts_list
  belongs_to :user
  has_many :gifts

  accepts_nested_attributes_for :gifts, :reject_if => :all_blank, :allow_destroy => true


  validates :name, presence: true
  validates :user_id, presence: true

  after_initialize :ensure_slug

  def ensure_slug
    self.slug ||= SecureRandom.hex(5)
  end

  def to_param
    slug
  end
  
end

class Agent < ActiveRecord::Base
  has_many :contacts
  belongs_to :contact
  accepts_nested_attributes_for :contacts
  validates :title, presence: true

end

class Contact < ActiveRecord::Base
  belongs_to :agent, foreign_key: "agent_id"
  validates :email, presence: true, :email => true

end

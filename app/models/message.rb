class Message < ApplicationRecord
  belongs_to :verification
  belongs_to :user
  validates_presence_of :verification_id
  validates_presence_of :user_id
end

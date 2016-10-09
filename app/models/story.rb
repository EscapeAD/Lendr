class Story < ApplicationRecord
  belongs_to :checkout
  has_many :story_photos, dependent: :destroy
  accepts_nested_attributes_for :story_photos

  def self.story_check(checkout_user_id)
    story = Story.find_by(checkout_id: checkout_user_id)
      if story.nil?
        return false
      elsif story.completed == false
        return true
      else
        return false
      end
  end
end

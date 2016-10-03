class Story < ApplicationRecord
  belongs_to :checkout


  private
  def self.story_check(checkout_user_id)
    story = Story.find_by(checkout_id: checkout_user_id)
    if story.completed == false
      return true
    end
  end
end

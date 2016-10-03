class Story < ApplicationRecord
  belongs_to :checkout


  private
  def self.story_check(checkout_user_id)
    story = Story.find_by(checkout_id: checkout_user_id)
    if story  == nil
      return false
    end
    if story.completed == false
      return true
    end
    return false
  end
end

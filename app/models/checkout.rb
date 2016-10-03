class Checkout < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many   :verifications
  has_many   :stories

  private

  def self.borrow_list(user_id)
    list = Checkout.where(user_id: user_id)
    final = []
    list.each do | item |
      if item[:check_initial] == true && item[:due_date] != nil && item[:returned] == false
        final << item
      end
    end
      return final
  end

  def self.lent_out(user_id)
    inventory = Item.where(user_id: user_id)
    list      = []
    checkout  = Checkout.all
    checkout.each do |item|
      inventory.each do |invent_item|
        if item[:item_id] == invent_item[:id] && item[:returned] == false && item[:check_initial] == true && item[:due_date] != nil && item[:returned] == false
          list << item
        end
      end
    end
    return list
  end

  def self.pending(userId)
    inventory = Item.where(user_id: userId)
    list      = []
    checkouts  = Checkout.all
    stories   = Story.all
    checkouts.each do |checkout|
      if checkout[:user_id] == userId && checkout[:due_date] == nil
        list << checkout
      end

      inventory.each do |invent_item|
        if checkout[:item_id] == invent_item[:id] && checkout[:due_date] == nil
          # && item[:check_initial] == false
          list << checkout
        end
      end

      stories.each do | story |
        if (userId == checkout[:id]) && (checkout[:id] == story[:checkout_id] && story[:completed] == false)
            item_story = Checkout.find(story.checkout_id)
            list << item_story
            puts story.checkout_id
        end
      end
    end
    return list.uniq
  end
## collects the stories of the item
  def self.collect_story(item_primary_key)
    checkout_story_list = Checkout.where(item_id: item_primary_key)
    array_of_stories    = []
    checkout_story_list.each do |checkout_list|
      stories = Story.where(checkout_id: checkout_list.id)
      stories.each do | story |
      array_of_stories << story
    end
    end
    return array_of_stories
  end

end

class Checkout < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many   :verifications
  has_many   :stories

  def self.borrow_list(user_id)
    # current list of items borrowed out to user
    list = Checkout.where(user_id: user_id)
    final = []
    list.each do |item|
      if item[:check_initial] == true && !item[:due_date].nil? && item[:returned] == false
        final << item
      end
    end
      return final
  end

  def self.lent_out(user_id)
    # current list of items left out by user
    inventory = Item.where(user_id: user_id)
    list      = []
    checkout  = Checkout.all
    checkout.each do |item|
      inventory.each do |invent_item|
        if item[:item_id] == invent_item[:id] && item[:returned] == false && item[:check_initial] == true && !item[:due_date].nil?  && item[:returned] == false
          list << item
        end
      end
    end
    return list
  end

  def self.pending(current_user_id)
    inventory     = Item.where(user_id: current_user_id)
    list          = []
    checkouts     = Checkout.all
    stories       = Story.all
    checkouts.each do |checkout|
        # Check for pending requests for borrowing.
      if checkout[:user_id] == current_user_id && checkout[:due_date].nil?
        list << checkout
      end
      inventory.each do |invent_item|
        if checkout[:item_id] == invent_item[:id] && checkout[:due_date].nil?
          list << checkout
        end
      end
        # Check for non completed/pending stories to be written
      stories.each do |story|
        if (current_user_id == checkout[:user_id]) && (checkout[:id] == story[:checkout_id] && story[:completed] == false)
            item_story = Checkout.find(story.checkout_id)
            list << item_story
        end
      end
    end
    return list.uniq
  end
  # collects the stories of the item
  def self.collect_story(item_primary_key)
    checkout_story_list = Checkout.where(item_id: item_primary_key)
    array_of_stories    = []
    checkout_story_list.each do |checkout_list|
      stories = Story.where(checkout_id: checkout_list.id, completed: true)
      stories.each do |story|
        array_of_stories << story
      end
    end
    return array_of_stories
  end
end

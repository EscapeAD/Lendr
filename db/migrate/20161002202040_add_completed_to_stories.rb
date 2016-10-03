class AddCompletedToStories < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :completed, :boolean, default: false
  end
end

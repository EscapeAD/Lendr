class AddCheckInitialToCheckout < ActiveRecord::Migration[5.0]
  def change
    add_column :checkouts, :check_initial, :boolean, default: false
  end
end

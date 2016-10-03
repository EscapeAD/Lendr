class Item < ApplicationRecord
  has_many :checkouts
  has_many :pictures, inverse_of: :item, dependent: :destroy
  accepts_nested_attributes_for :checkouts
  accepts_nested_attributes_for :pictures, :allow_destroy => true

private


end

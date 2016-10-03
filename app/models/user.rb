class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :owned_items, class_name: 'Item'
  has_many :checkouts

  geocoded_by :full_address  # can also be an IP address
  after_validation :geocode, if: :address_changed?    # auto-fetch coordinates

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address

  private
  def full_address
    address + " " + city
  end

end

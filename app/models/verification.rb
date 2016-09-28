class Verification < ApplicationRecord
  belongs_to :checkout


  def self.verify_show_pickup(input_id)
    Verification.where(checkout_id: input_id, status: 'pickup')[0][:id]
  end

end

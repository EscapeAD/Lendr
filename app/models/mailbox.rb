class Mailbox < ApplicationRecord

  def mailbox_notice(sender_id, item)
  Mailbox.new(title: "Notice: #{item.name}",
                    recipient: item.user_id,
                    text: 'You have recieve a request about item',
                    sender: sender_id,
                    open: false)
  end
end

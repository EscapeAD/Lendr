class MessagesController < ApplicationController
  def create
  @message = Message.new(mess_params)
  @message.save
  redirect_to :back
  end

private

def mess_params
  params.require(:message).permit(:verification_id, :content).merge(user_id: current_user.id)
end

end

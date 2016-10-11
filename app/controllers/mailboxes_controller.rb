class MailboxesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @mails = Mailbox.where(recipient: current_user.id)
  end

  def show
    @new_mail   = Mailbox.new
    @mail       = Mailbox.find(params[:id])
    @sender     = @mail.sender
    @recipient  = @mail.recipient
    @mail.update_attribute(:unread, false)
    @mail.save
  end

  def new
    @mail = Mailbox.new
  end

  def create
    puts params
    @mail = Mailbox.new(title: params[:title],
                      recipient: params[:recipient],
                      text: params[:text],
                      sender: current_user.id)
    if @mail.save
      redirect_to item_path(params[:id])
    else
      render :new
    end
  end

  def destroy
    @mail = Mailbox.find(params[:id])
    @mail.destroy
    @mail.save
    redirect_to mailboxes_path
  end

private
# def email_params
#   # params.require(:mail).permit(:title, :recipient, :text, :sender).merge(open: false)
# end

def set_user
  @user = current_user
end

end

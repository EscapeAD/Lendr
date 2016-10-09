class MailboxesController < ApplicationController
  before_action :set_user

  def index
    @mails = Mailbox.where(:recipient == current_user.id)
  end

  def show
    @mail = Mailbox.find(params[:id])
    @mail.update_attribute(:open, true)
    @mail.save
  end

  def new
    @mail = Mailbox.new
  end

  def create
    @mail = Mailbox.new(title: params[:title],
                     recipient: params[:recipient],
                      text: params[:text],
                      sender: current_user.id,
                      open: false)
    if @mail.save
      redirect_to root_path
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

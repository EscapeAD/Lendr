class MailsController < ApplicationController
  def index
    @mails = Mail.where(:recipient == current_user.id)
  end

  def show
    @mail = Mail.find(params[:id])
    if @mail.open == true
      @mail.open = false
      @mail.save
    end
  end

  def new
    @mail = Mail.new
  end

  def create
    @mail = Mail.new(title: params[:mailTitleInput] ,sender: current_user.id, recipient: params[:ownerId], text: params[:mailTextInput])
    if @mail.save
      redirect_to root_path
    else
      render :new
    end
  end


private
def mail_params
  params.require(:mail).permit(:title,:sender,:recipient,:text)
end

def set_user
  @user = current_user
end

end

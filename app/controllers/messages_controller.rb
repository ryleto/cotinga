class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:contact])
    @message.request = request
    if @message.deliver
      flash.now[:error] = nil
      flash.now[:notice] = 'Thank you, your message has been sent!'
    else
      flash.now[:error] = 'Unable to send message.'
      render :new
    end
  end
end

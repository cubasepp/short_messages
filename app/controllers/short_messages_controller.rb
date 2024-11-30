class ShortMessagesController < ApplicationController
  def create
    head(:ok)
  end


  private

  def short_message_params
    params.require(:short_message).permit(:message)
  end
end

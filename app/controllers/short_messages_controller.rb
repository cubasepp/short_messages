class ShortMessagesController < ApplicationController
  def create
    @short_message = ShortMessage.new(short_message_params)
    if @short_message.save
      head(:created)
    else
      head(:unprocessable_entity)
    end
  end


  private

  def short_message_params
    params.require(:short_message).permit(:message)
  end
end

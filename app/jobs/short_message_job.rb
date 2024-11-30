class ShortMessageJob < ApplicationJob
  queue_as :default

  def perform(params)
    short_message = ShortMessage.find(params[:id])
    short_message.message_chunks.each do |message|
      MessageService.perform(body: message)
    end
  end
end

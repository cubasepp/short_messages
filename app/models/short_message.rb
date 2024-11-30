class ShortMessage < ApplicationRecord
  attribute :message

  validates :message, presence: true

  def message=(value)
    super.tap do |value|
      self.message_chunks = to_message_chunks(value)
    end
  end

  def message
    @message ||= message_chunks&.join(" ")
  end


  private

  def to_message_chunks(value)
    value&.split
  end
end

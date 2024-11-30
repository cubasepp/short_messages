class ShortMessage < ApplicationRecord
  attribute :message

  validates :message, presence: true
  validate :validate_message_chunk_length

  class_attribute :max_chunk_length, default: 160
  class_attribute :chunk_suffix, default: "- part %s"

  after_create do
    ShortMessageJob.perform_later(id: id)
  end

  def message=(value)
    super.tap do |value|
      self.message_chunks = to_message_chunks(value)
    end
  end

  def message
    @message ||= message_chunks&.map&.with_index(1) do |chunk, index|
      chunk.gsub((self.class.chunk_suffix % index), "")
    end&.join(" ")
  end


  private

  def validate_message_chunk_length
    if message_chunks&.any? { |chunk| chunk.length > self.class.max_chunk_length }
      errors.add(:message, :invalid)
    end
  end

  def to_message_chunks(value)
    result, message, part = value&.split&.reduce([ [], "", 1 ]) do |(result, message, part), chunk|
      chunk_to_append = " #{chunk}"
      current_suffix = (self.class.chunk_suffix % part)

      if (message + chunk_to_append + current_suffix).length > self.class.max_chunk_length
        result << (message.presence || chunk).strip + current_suffix
        part += 1
        [ result, message.present? ? chunk_to_append.strip : "", part ]
      else
        [ result, (message + chunk_to_append).strip, part ]
      end
    end
    result << message + (self.class.chunk_suffix % part) if message&.present?
    result
  end
end

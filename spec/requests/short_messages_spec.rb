require 'rails_helper'

RSpec.describe "ShortMessages", type: :request do
  let(:message) { Faker::Lorem.sentence(word_count: 20) }
  let(:invalid_message) { Faker::Lorem.sentence(word_count: 20) }

  describe "POST /short_messages" do
    it "returns ok on a valid message" do
      post short_messages_url, params: { short_message: { message: } }, as: :json
      expect(response).to(have_http_status(:ok))
    end

    it "return unprocessable_entity on a invalid message" do
      post short_messages_url, params: { short_message: { message: invalid_message } }, as: :json
      expect(response).to(have_http_status(:unprocessable_entity))
    end
  end
end

require 'rails_helper'

RSpec.describe ShortMessage, type: :model do
  subject { described_class.new }

  describe "validations" do
    it { should validate_presence_of(:message) }
  end


  describe "#message" do
    context "split chunks" do
      let(:message) { Faker::Lorem.sentence }

      it "splits 4 Words into 4 chunks" do
        subject.message = message
        expect(subject.message_chunks).to(match_array(message.split))
      end
    end
  end
end

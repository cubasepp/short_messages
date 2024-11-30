require 'rails_helper'

RSpec.describe ShortMessageJob, type: :job do
  subject { described_class }

  describe do
    it "has a enqueued job" do
      expect do
        subject.perform_later(id: 2)
      end.to(have_enqueued_job)
    end
  end

  describe "call external service" do
    let(:short_message) { FactoryBot.create(:short_message) }


    it "calls the MessageSerive twice" do
      expect(MessageService).to(receive(:perform).once)
      subject.perform_now(id: short_message.id)
    end
  end
end

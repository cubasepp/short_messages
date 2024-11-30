require 'rails_helper'

RSpec.describe ShortMessage, type: :model do
  subject { described_class.new }

  describe "validations" do
    it { should validate_presence_of(:message) }
  end


  describe "#message" do
    before do
      ShortMessage.max_chunk_length = 20
    end

    context "split chunks" do
      let(:message) {  }

      it "splits 4 Words into 3 chunks" do
        subject.message = "Voluptas placeat ea est."
        expect(subject.message_chunks).to(match_array([ "Voluptas- part 1", "placeat ea- part 2", "est.- part 3" ]))
        expect(subject.valid?).to(be(true))
      end

      it "splits 5 Words into 5 chunks" do
        subject.message = "LoremImpsumNovum NovumImpsumLorem LoremImpsumNovum NovumImpsumLorem LoremImpsumNovum "
        expect(subject.message_chunks).to(match_array([
          "LoremImpsumNovum- part 1",
          "NovumImpsumLorem- part 2",
          "LoremImpsumNovum- part 3",
          "NovumImpsumLorem- part 4",
          "LoremImpsumNovum- part 5"
        ]))
        expect(subject.valid?).to(be(false))
      end
    end

    context "chunks to string" do
      let(:message) { "Voluptas placeat ea est." }
      it "converts a chunks split into a string" do
        subject.message = message
        subject.save!

        expect(subject.message_chunks).to(match_array([ "Voluptas- part 1", "placeat ea- part 2", "est.- part 3" ]))
        expect(subject.message).to(eql(message))
      end
    end
  end
end

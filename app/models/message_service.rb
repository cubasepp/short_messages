class MessageService
  FakeService = Struct.new do
    def perform
      true
    end
  end

  attr_accessor :service

  def initialize(service: FakeService.new)
    @service = service
  end

  class << self
    def perform(body:)
      new.service.perform
    end
  end
end

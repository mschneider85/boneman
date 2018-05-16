module Boneman::Events
  Dir["#{File.dirname(__FILE__)}/events/*.rb"].each { |file| require file }

  @events = [
    Ready
  ]

  def self.include!
    @events.each do |event|
      Boneman::BOT.include!(event)
    end
  end
end

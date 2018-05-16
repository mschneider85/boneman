module Boneman::Commands
  Dir["#{File.dirname(__FILE__)}/commands/*.rb"].each { |file| require file }

  @commands = [
    Toss
  ]

  def self.include!
    @commands.each do |command|
      Boneman::BOT.include!(command)
    end
  end
end

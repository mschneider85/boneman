module Boneman::Events::Ready
  extend Discordrb::EventContainer

  ready do |event|
    event.bot.game = 'Bone'
  end
end

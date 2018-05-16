require_relative '../store.rb'

module Boneman::Commands::Toss
  extend Discordrb::Commands::CommandContainer

  command(:reset, description: 'Resets bones.') do |event|
    Store[event.channel] = {}
    'Bones sorted. Ready to throw.'
  end
end

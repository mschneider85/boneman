require 'rubygems'
require 'yaml'

require 'bundler/setup'
Bundler.require(:default)

module Boneman
  CONFIG = YAML.load_file('config/discord.yml')

  BOT = Discordrb::Commands::CommandBot.new(
    token: CONFIG['token'],
    client_id: CONFIG['client_id'],
    prefix: '!'
  )
  Discordrb::LOGGER.info "This bot's invite URL is #{BOT.invite_url}."

  require_relative 'boneman/commands'
  require_relative 'boneman/events'

  Boneman::Commands.include!
  Boneman::Events.include!

  BOT.run
end

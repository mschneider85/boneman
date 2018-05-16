require_relative '../store.rb'

module Boneman::Commands::Toss
  extend Discordrb::Commands::CommandContainer

  def self.description
    <<-HEREDOC
      ☠ Toss a bone. ☠
      Type `!toss` to toss a bone at random direction and get a saying of wisdom.
      Type `!toss [name]` to ignore channel users and toss the bone a specific person. Get a saying of wisdom as well.
    HEREDOC
  end

  command(:toss, description: description) do |event, name|
    channel_store = Store[event.channel] ||= {}
    channel_store[:users] ||= []
    channel_store[:statements] ||= []

    if channel_store[:users].empty?
      channel_store[:users] = event.channel.users.shuffle
    end

    if channel_store[:statements].empty?
      channel_store[:statements] = YAML.load_file('config/sayings.yml').shuffle
    end

    channel_store[:statements].pop.gsub('{{name}}', (name || Store[event.channel][:users].pop.username))
  end
end

require "bitopro"
require 'telegram/bot'
require 'yaml'
require 'json'
require_relative 'lib/telegram-bot.rb'

$settings = YAML.load_file('./config.yml')

Bitopro.configure do |config|
  config.email = $settings[:bitopro][:email]
  config.key = $settings[:bitopro][:key]
  config.secret = $settings[:bitopro][:secret]
end

bp_client = Bitopro::Client.new

Telegram::Bot::Client.run($settings[:telegram_token]) do |bot|
  bot.listen do |message|
    puts "message.text #{message.text}"
    text = case message.text.downcase
    when 'ping'
      'pong'
    when 'help', 'ls'
      "
You can control me by sending these commands:
balance
order
history
      "
    when 'balance', 'balances', 'account_balance', 'account_balance'
      bp_client.account_balance.to_s
    when 'order', 'orders'
      bp_client.order_list(pair: "btc_twd", page: 1, active: false).to_s
    when 'history', 'histories', 'order_history', 'order_histories'
      bp_client.order_history.to_s
    else
      nil
    end
    puts "text #{text}"
    bot.api.send_message(chat_id: message.chat.id, text: text) if text
  end
end

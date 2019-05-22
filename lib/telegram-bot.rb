require 'telegram/bot'
require 'yaml'

module TelegramBot
  def self.start!
    Telegram::Bot::Client.run($settings[:telegram_token]) do |bot|
      bot.listen do |message|
        case message.text
        when 'help'
          ans = "
You can control me by sending these commands:

ls
ping

          "
          bot.api.send_message(chat_id: message.chat.id, text: ans)
        when 'ls'
          bot.api.send_message(chat_id: message.chat.id, text: '?')
        when 'ping'
          bot.api.send_message(chat_id: message.chat.id, text: 'pong')
        end
      end
    end
  end
end


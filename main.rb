require 'telegram/bot'
require_relative 'lib/telegram-bot.rb'

$settings = YAML.load_file('./config.yml')

TelegramBot.start!
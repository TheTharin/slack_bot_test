class Bot < SlackRubyBot::Bot
  @id = 0

  def self.next_id
    @id = @id % 10 + 1
  end

  command 'say' do |client, data, match|
    text = match['expression']

    Rails.cache.write next_id, text: text
    client.say(channel: data.channel, text: text)
  end
end

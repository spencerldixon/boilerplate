require "tty-prompt"

module Robots
  def install_robots(silent: false, **)
    prompt = TTY::Prompt.new(quiet: true)

    if silent || prompt.yes?("Disallow OpenAI's GPTBot web crawler in robots.txt?")
      append_to_file 'public/robots.txt' do
        <<-eos
User-agent: GPTBot
Disallow: /
        eos
      end
    end
  end
end

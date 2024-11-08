require "tty-prompt"

module Gitignore
  def install_gitignore(silent: false, **)
    prompt = TTY::Prompt.new(quiet: true)

    if silent || prompt.yes?("Extend gitignore to ignore database dumps, per environment credential keys, and macos default files?")
      append_to_file '.gitignore' do
        <<-eos
.env
.DS_Store

# Ignore any DB dumps
*.sql
*.sqlite
*.dump

# Ignore credential keys
/config/credentials/production.key
/config/credentials/development.key
/config/credentials/test.key

dump.rdb
.byebug_history
        eos
      end
    end
  end
end

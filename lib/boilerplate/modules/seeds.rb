require "tty-prompt"

module Seeds
  def install_seeds(silent: false, **)
    prompt = TTY::Prompt.new(quiet: true)

    if silent || prompt.yes?("Generate a seed user?")
      # Install metatags
      append_to_file 'db/seeds.rb' do
        <<-eos
User.create(
  email: "test@test.com",
  password: "test1234",
  password_confirmation: "test1234",
  terms_and_conditions: true,
  admin: true
).confirm!
        eos
      end
    end
  end
end

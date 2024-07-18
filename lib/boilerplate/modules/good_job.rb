require "tty-prompt"

module GoodJob
  def install_good_job(silent: false, **)
    prompt = TTY::Prompt.new(quiet: true)

    # TODO - add default job config and good_job initializer

    if silent || prompt.yes?("Install GoodJob?")
      gem "good_job"
      run "bundle install"
      rails_command "g good_job:install"
      inject_into_file 'config/application.rb', before: /^\s\send\nend/ do
        <<-eos

    config.active_job.queue_adapter = :good_job
        eos
      end

      after_bundle do
        append_to_file 'Procfile.dev', 'worker: bundle exec good_job start'
      end

      if silent || prompt.yes?("Install GoodJob dashboard for admins only?")
        route <<-eos
  authenticate :user, ->(user) { user.admin? } do
    mount GoodJob::Engine => 'good_job'
  end
          eos
      end
    end
  end
end

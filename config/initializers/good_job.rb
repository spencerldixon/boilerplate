Rails.application.configure do
  config.good_job = {
    preserve_job_records: true,
    retry_on_unhandled_error: false,
    execution_mode: :external,
    poll_interval: 10
  }
end

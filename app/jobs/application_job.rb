class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  discard_on ActiveJob::DeserializationError

  # Retry up to 2 extra times after the first attempt, then hand off to Background Worker to discard
  retry_on StandardError, wait: :exponentially_longer, attempts: 3
end

require 'sidekiq-cron'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end

Sidekiq::Cron::Job.create(
  name: 'Send reminders',
  cron: '*/10 * * * *',
  class: 'ReminderWorker'
)
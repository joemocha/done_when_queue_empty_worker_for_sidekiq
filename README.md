# DoneWhenQueueEmptyWorkerForSidekiq

Like Sidekiq's standard worker, but will exit when the queue runs dry.

## Installation

Add this line to your application's Gemfile:

    gem 'done_when_queue_empty_worker_for_sidekiq', github: 'samsm/done_when_queue_empty_worker_for_sidekiq'
    run done_when_queue_empty_worker

## Usage

I wrote this quick hack to reduce cost/compexity of Heroku workers in non-production environments.

It costs ~$35 to run an on-all-the-time worker on Heroku.
However, my experience has been that there is less than $1 worth of work to be done in a staging or acceptance environment.

Add done_when_queue_empty_worker_for_sidekiq to your Procfile. In environments where you do not need an always-on worker, set this done when empty worker to run every 10 minutes. Most the time it will immediately exit, charging you practically nothing.

Or just fire it up to help out when a queue is running high.

## Contributing

1. Fork it ( https://github.com/samsm/done_when_queue_empty_worker_for_sidekiq/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

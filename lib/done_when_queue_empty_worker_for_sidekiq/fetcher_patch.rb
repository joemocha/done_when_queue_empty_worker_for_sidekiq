module Sidekiq
  class Fetcher
    def fetch
      # watchdog('Fetcher#fetch died') do
        return if Sidekiq::Fetcher.done?

        begin
          work = @strategy.retrieve_work
          ::Sidekiq.logger.info("Redis is online, #{Time.now.to_f - @down.to_f} sec downtime") if @down
          @down = nil

          if work
            @mgr.async.assign(work)
          else
            Fetcher.done!
            @mgr.stop
            raise Interrupt
          end
        rescue => ex
          handle_fetch_exception(ex)
        end
      # end
    end
  end
end

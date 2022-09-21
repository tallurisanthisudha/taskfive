class HardWorker
    include Sidekiq::Worker
  
    def perform(*args)
      p 'Task finished!'
      uri = URI('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd')

        request = Net::HTTP.get(uri)
        @price = JSON.parse(request) ["bitcoin"] ["usd"]
    end

    Sidekiq::Cron::Job.create( name: 'Hard worker - every at 5pm', cron: '30 11 * * *', class: 'HardWorker')
  end
class RubyGameHub::API < Grape::API
  version 'v1'

  get '/' do
    []
  end

  resource :players do
    get '/' do
      @players = Player.all.order('created_at ASC').select('id, username, created_at, updated_at')
    end

    get '/:username' do
      @player = Player.where(username: params[:username]).limit(1).select('id, username, created_at, updated_at')
    end
  end

  resource :match do
    get '/' do
      {game: '182.82.182.1:45192', active: false, slots: '1|4'}
    end
  end

  resource :hub do
    get '/' do
      {game: 0, online_players: 0, average_wait_time: 63.7, players_in_queue: 0}
    end
  end
end

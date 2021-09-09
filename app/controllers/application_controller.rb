require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/teams' do
        @team = Team.new(params[:team][:name], params[:team][:motto])
        params[:team][:members].each do |m|
            SuperHero.new(m[:name], m[:power], m[:bio])
        end
        @members = SuperHero.all
        erb :team
    end
end

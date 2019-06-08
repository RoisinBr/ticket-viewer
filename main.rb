require 'sinatra'
require 'sinatra/reloader'
# require 'sinatra/flash'
require 'pry'
require 'httparty'

# enable :sessions
set :show_exceptions, false

get '/' do
  erb :index
end

get '/ticket-list' do
  authentication = {:username => "roisin.briscoe@gmail.com", :password => ENV["zendesk_password"]}
  url = 'https://roisin.zendesk.com/api/v2/tickets.json?page=1&per_page=25'
  @tickets = HTTParty.get(url, :basic_auth => authentication)
  erb :list_tickets
end

get '/ticket-list/paginate' do
  authentication = {:username => "roisin.briscoe@gmail.com", :password => ENV["zendesk_password"]}
  url = "#{params["link"]}"
  @tickets = HTTParty.get(url, :basic_auth => authentication)
  erb :list_tickets
end

get '/ticket-info' do
  authentication = {:username => "roisin.briscoe@gmail.com", :password => ENV["zendesk_password"]}
  url = "https://roisin.zendesk.com/api/v2/tickets/#{params["id"]}.json"
  # if "#{params["id"]}".to_i < 101
  @ticket_object = HTTParty.get(url, :basic_auth => authentication)
  erb :view_ticket
  # else 
  #   flash[:notice] = "There is no valid ticket"
  #   erb :no_valid_ticket
  # end
end

error 500 do
  @error = env['sinatra.error']
  erb :error
end
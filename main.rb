require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'

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
  @ticket_object = HTTParty.get(url, :basic_auth => authentication)
  erb :view_ticket
end

error 500 do
  @error = "Either you have entered an invalid ticket number or zendesk is currently unavailable"
  erb :error
end

error 401 do
  @error = "Couldn't authenticate you"
  erb :error
end
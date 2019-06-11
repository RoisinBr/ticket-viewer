require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require_relative 'errors'

authentication = {
  :username => 'roisin.briscoe@gmail.com',
  :password => ENV['zendesk_password']
}

get '/' do
  erb :index
end

get '/ticket-list' do
  url = params['link'].to_s
  @tickets = HTTParty.get(url, :basic_auth => authentication)
  erb :list_tickets
end

get '/ticket-info' do
  url = "https://roisin.zendesk.com/api/v2/tickets/#{params['id']}.json"
  @ticket_object = HTTParty.get(url, :basic_auth => authentication)
  erb :view_ticket
end

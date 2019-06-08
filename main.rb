require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'
require 'httparty'
require 'kaminari'

get '/' do
  erb :index
end

get '/ticket-list' do
  authentication = {:username => "roisin.briscoe@gmail.com", :password => ENV["zendesk_password"]}
  url = 'https://roisin.zendesk.com/api/v2/tickets.json?page=1&per_page=25'
  @tickets = HTTParty.get(url, :basic_auth => authentication)
  erb :list_tickets
end


# GET /api/v2/tickets/{id}.json


get '/ticket-info' do
  authentication = {:username => "roisin.briscoe@gmail.com", :password => ENV["zendesk_password"]}
  url = "https://roisin.zendesk.com/api/v2/tickets/#{params["id"]}.json"
  @ticket_object = HTTParty.get(url, :basic_auth => authentication)
  erb :view_ticket
end

# get '/ticket-list/next-page' do
#   authentication = {:username => "roisin.briscoe@gmail.com", :password => ENV["zendesk_password"]}
#   if url
#     url = "#{params["link"]}"
#     @tickets = HTTParty.get(url, :basic_auth => authentication)
#     erb :list_tickets
#   end
# end

# while url do
#   url = @tickets["next_page"]
# end 






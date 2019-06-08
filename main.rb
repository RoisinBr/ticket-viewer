require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'

get '/' do
  erb :index
end

get '/ticket-list' do
  authentication = {:username => "roisin.briscoe@gmail.com", :password => ENV["zendesk_password"]}
  url = 'https://roisin.zendesk.com/api/v2/tickets.json?per_page=25'
  @tickets = HTTParty.get(url, :basic_auth => authentication)
  erb :list_tickets
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






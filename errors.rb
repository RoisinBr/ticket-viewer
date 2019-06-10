set :show_exceptions, false

error 500 do
  @error = "Either you have entered an invalid ticket number or zendesk is currently unavailable"
  erb :error
end
  
error 401 do
  @error = "Couldn't authenticate you"
  erb :error
end
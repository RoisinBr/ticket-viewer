ENV['APP_ENV'] = 'test'

require_relative 'main'
require 'test/unit'
require 'rack/test'

class MainTest < Test::Unit::TestCase
    include Rack::Test::Methods

    def app
        Sinatra::Application
    end

    def test_root
        get '/'
        assert last_response.ok?
    end

    def test_root_displaying_correctly
        get '/'
        assert last_response.body.include?('Ticket Viewer')
    end

    def test_ticket_list
        get '/ticket-list'
        assert last_response.ok?
    end

    def test_ticket_list_pagination
        get '/ticket-list/paginate', :link => 'https://roisin.zendesk.com/api/v2/tickets.json?page=2&per_page=25'       
        assert last_response.ok?
    end

    def test_tickets_being_displayed
        get '/ticket-list'
        assert last_response.body.include?('Status')
    end

    def test_ticket_view
        get '/ticket-info', :id => 5
        assert last_response.ok?
    end

    def test_individual_ticket_information_displayed
        get '/ticket-info', :id => 5
        assert last_response.body.include?('Description')
    end

end
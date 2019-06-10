# Ticket Viewer

Allows you to view your support tickets from Zendesk.

## Installation
Download/clone files.

Where the files are located install required gems by typing bundle install in the command line.

If you don't have bundle installed these are the required gems, type in the command line:

1. gem install sinatra
2. gem install httparty
3. gem install test-unit
4. gem install rack-test

## Usage

Open main.rb and replace ENV["zendesk_password"] (line 7) with password supplied in email submission.

To run tests type: ruby main_test.rb

To run main app type: ruby main.rb - this will start the server.
Open a browser and navigate to localhost:4567 (port may differ depending on configeration)

Navigate through pages.

## Lessons learned

Throughout this challenge I have learnt many new skills including:

- Pagination
- Custom error messages
- Route testing

## Future Directions

- As complexity increases css can be merged into one file to increase speed.
- Allow uses to update/edit tickets as required.
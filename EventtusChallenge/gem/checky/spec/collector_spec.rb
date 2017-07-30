require "spec_helper"
module Checky
  describe Collector do

    context "when #initialize" do
      it "create Gemfile if no gemfile" do
        collector = Collector.new
        expect(collector.gemfile).to eq "Gemfile"
      end
      it "create a Gemfile if the given file not found" do
        collector = Collector.new("newfile.txt")
        expect(collector.gemfile).to eq "Gemfile"
      end
      it "do not create file if file given found" do
        File.open("newfile.txt", "w+")
        collector = Collector.new("newfile.txt")
        expect(collector.gemfile).to eq "newfile.txt"
        File.delete("newfile.txt")
      end
    end
    context "when it created" do
      it "should return back a list of gems" do
        collector = Collector.new("testgemfile")
        expect(collector.gemlist).to eq ["rails", "sqlite3", "puma", "sass-rails",
                                      "uglifier", "sprockets", "coffee-rails",
                                      "therubyracer", "jquery-rails", "turbolinks",
                                      "jbuilder", "redis", "bcrypt", "aws-sdk",
                                      "paypal-sdk-adaptivepayments",
                                      "eu_central_bank", "money",
                                      "google_currency", "httparty",
                                      "capistrano-rails", "mysql2",
                                      "angular-rails-templates", "responders",
                                      "devise", "twilio-ruby", "paperclip",
                                      "rethinkdb", "nobrainer", "sinatra",
                                      "rails_admin", "rails_12factor",
                                      "rails_serve_static_assets",
                                      "rails_stdout_logging", "byebug",
                                      "capybara-webkit",
                                      "web-console", "spring"]
      end
    end
  end
end

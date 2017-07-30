require "spec_helper"
module Checky
  describe Viewer do
    context "when #initialize" do
      it "can detect the Operating system" do
        viewer = Viewer.new
        expect(viewer.os).to eq("x86_64-linux")
      end
      it "has a list of gem names when pass a pass" do
        viewer = Viewer.new("linux", "testgemfile")
        expect(viewer.gemlist).to eq ["rails", "sqlite3", "puma", "sass-rails",
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
      it "has a hash datatype for system_lib" do
        viewer = Viewer.new
        expect(viewer.system_lib).to eq Hash.new
      end
    end

    context "when Getting a system libararies" do
      it "return an array of libararies" do
        viewer = Viewer.new("Linux", "testgemfile")
        expected_value = {:"capybara-webkit" => ["libqtwebkit-dev"]}
        expect(viewer.liblist).to eq expected_value
      end
    end
  end
end

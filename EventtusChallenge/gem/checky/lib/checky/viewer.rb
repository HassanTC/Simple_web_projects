module Checky
  class Viewer
    attr_accessor :os, :gemfile, :system_lib, :gemlist, :installer

    def initialize(os = RUBY_PLATFORM, gemfile = "Gemfile")
      @os = os
      @gemlist = Checky::Collector.new(gemfile).gemlist
      @system_lib = {}
    end

    def liblist
      @gemlist.each {|gem_name| system_libararies(gem_name) }
      @system_lib
    end

    private
    def system_libararies(gem_name)
      response = HTTParty.get URI.escape("http://checkyapi.herokuapp.com/checky"),
        query: {
          os_name: @os,
          gem_name: gem_name
        }
       normalize(response,gem_name) if response.code == 200
    end

    def normalize(response,gem_name)
      @installer = response['install_code']
      @system_lib[gem_name.to_sym] = response['libararies']
    end

  end
end

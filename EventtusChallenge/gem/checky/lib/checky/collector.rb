module Checky
  ### Collector Class is a simple Class
  # With a specific job to Collect all Gems
  # from your Gemfile, or other if you
  # initialized other file
  class Collector

    attr_accessor :gemfile

    def initialize(gemfile = "Gemfile")
      @gemfile = exists?(gemfile) ? gemfile : create_gem
    end

    # gemlist method to return an array of gems
    # That extracted from the given Gemfile
    def gemlist
      array_of_gems = File.readlines(@gemfile) - ["\n"]
      array_of_gems.map {|line| get_gemname(line) }.reject(&:empty?).uniq.flatten
    end

    private

    def exists? gemfile
      File.exists? File.expand_path(gemfile.to_s)
    end

    def create_gem
      File.open("Gemfile", "w+") {|f| f.write("# write your gems overhere\n") } unless File.exists? "Gemfile"
      "Gemfile"
    end

    def get_gemname line
      return "" unless line.include?("gem ") || line.include?("#")
      line.gsub("'", '"').scan(/"([^"]+)"/)[0] || ""
    end

  end
end

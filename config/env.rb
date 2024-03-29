path = File.expand_path '../../', __FILE__
APP = "vasanews"

require "bundler/setup"
Bundler.require :default
module Utils
  def require_all(path)
    Dir.glob("#{path}/**/*.rb") do |model|
      require model
    end
  end
end
include Utils

env = ENV["RACK_ENV"] || "development"
# DataMapper.setup :default, "mysql://localhost/vasanews_#{env}"
require_all "#{path}/models"
# DataMapper.finalize
require "open-uri"
GOSUGAMERS =  SimpleRSS.parse open("http://gosugamers.net/all.rss")
path = File.expand_path '../', __FILE__

require "#{path}/config/env.rb"

class Vasanews < Sinatra::Base
  include Voidtools::Sinatra::ViewHelpers

  # partial :comment, { comment: "blah" }
  # partial :comment, comment

  def partial(name, value)
    locals = if value.is_a? Hash
      value
    else
      hash = {}; hash[name] = value
      hash
    end
    haml "_#{name}".to_sym, locals: locals
  end

  def imagify(text)
    text.gsub(/(http:\/\/[^\s]+\.(jpg|png))/, "<img src='\\1'>")
  end
end

require_all "#{path}/routes"
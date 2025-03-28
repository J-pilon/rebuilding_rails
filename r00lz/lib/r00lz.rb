require_relative 'r00lz/version'
require 'debug'

# TODO: step through the logic of this code

module R00lz
  class App
    def call(env)
      klass, act = cont_and_act(env)
      text = klass.new(env).send(act)

      [ 200, {"Content-Type" => "text/html"}, [text] ]
    end

    def cont_and_act(env)
      _, con, act, after = env["PATH_INFO"].split('/')
      con = con.capitalize + "Controller"
      [Object.const_get(con), act]
    end
  end
end

module R00lz
  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end
  end
end

module R00lz
  def self.to_underscore(s)
    s.gsub(
      /([A-Z]+)([A-Z][a-z])/,
      '\1_\2').gsub(
      /([a-z\d])([A-Z])/,
      '\1_\2').downcase
  end
end


class Object
  def self.const_missing(c)
    puts R00lz.to_underscore(c.to_s)
    require R00lz.to_underscore(c.to_s)
    Object.const_get(c)
  end
end

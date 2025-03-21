require_relative "r00lz/version"

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

  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end
  end
end

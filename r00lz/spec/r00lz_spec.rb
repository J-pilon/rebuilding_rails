class TedController < R00lz::Controller
  def think; "Whoah, man..."; end
end

RSpec.describe R00lz do
  it "has a version number" do
    expect(R00lz::VERSION).not_to be nil
  end

  it "new controller action returns success" do
    env = {
      "PATH_INFO" => "/ted/think",
      "QUERY_STRING" => ""
    }

    expect(::R00lz::App.new.call(env)[0]).to be(200)
  end

  it "request returns params" do
    env = {
      "PATH_INFO" => "/ted/think",
      "QUERY_STRING" => "automobile=car"
    }

    expect(::R00lz::Controller.new(env).request.params).to include("automobile" => "car")
  end

  it "autoloads a controller" do
    $LOAD_PATH << "#{__dir__}/mocks"

    env = {
      "PATH_INFO" => "/foo/bar",
      "QUERY_STRING" => ""
    }

    expect(::R00lz::App.new.call(env)[0]).to be(200)
  end

  it "loads a model successfully" do
    env = {
      "PATH_INFO" => "/foo/my_model",
      "QUERY_STRING" => ""
    }

    expect(::R00lz::App.new.call(env)[2]).to include("Foo")
  end
end

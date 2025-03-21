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
end

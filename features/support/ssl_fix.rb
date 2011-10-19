module Capybara::Driver::RackTest::SslFix

  [:get, :post, :put, :delete].each do |method|
    define_method method do |*args|
      args[0] = path_to_ssl_aware_url(args[0])
      super(*args)
    end
  end

  private

  def path_to_ssl_aware_url(path)
    unless path =~ /:\/\//
      env = request.env
      path = "#{env["rack.url_scheme"]}://#{env["SERVER_NAME"]}#{path}"
    end
    path
  rescue Rack::Test::Error
    # no request yet
    path
  end

end

Capybara::Driver::RackTest.send :include, Capybara::Driver::RackTest::SslFix

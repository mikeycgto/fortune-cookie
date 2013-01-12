require 'bundler/setup'
Bundler.require

configure do
  set :fortune_file, File.expand_path('../fortunes', __FILE__)
end

helpers do
  def fortunes
    @fortunes ||= File.read(settings.fortune_file).split('%').map(&:strip!)
  end

  def random_fortune
    fortunes[rand(fortunes.size)]
  end

  def escape(str)
    Rack::Utils.escape str
  end
end

get '/' do
  response['Set-Cookie'] = escape(random_fortune)

  status 204
end

get '*' do
  redirect '/'
end

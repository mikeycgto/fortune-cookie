require 'bundler/setup'
Bundler.require

configure do
  set :fortune_file, File.expand_path('../fortunes', __FILE__)

  @@fortunes = File.read(settings.fortune_file).split('%').map!(&:strip!)
end

helpers do
  def fortunes
    @@fortunes
  end

  def random_fortune
    fortunes[rand(fortunes.size)]
  end

  def escape(str)
    Rack::Utils.escape str
  end
end

before do
  response['Access-Control-Allow-Origin'] = '*'
  response['Access-Control-Allow-Method'] = 'GET'
end

get '/' do
  fortune = random_fortune

  response['Set-Cookie'] = escape(fortune)

  if request.env['HTTP_ORIGIN']
    halt 200, fortune
  else
    halt 204
  end
end

get '*' do
  redirect '/'
end

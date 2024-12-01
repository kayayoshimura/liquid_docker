require 'sinatra'
require 'liquid'
require 'json'

# JSONファイルを読み込む
settings = JSON.parse(File.read('config/settings.json'))
data = JSON.parse(File.read('config/data.json'))

# データを統合
context = settings.merge(data)

get '/' do
  # テンプレートを読み込む
  template = File.read('templates/theme.liquid')

  # Liquidでレンダリング
  Liquid::Template.parse(template).render(context) do |name|
    # 部分テンプレートを読み込む
    File.read("templates/#{name}.liquid")
  end
end

set :bind, '0.0.0.0'

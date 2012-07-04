require 'application'

use Rack::CanonicalHost, 'wufoo.cobregratis.com.br'
run Sinatra::Application
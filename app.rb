require 'rubygems'
require 'bundler/setup'

require 'sinatra/base'

class App < Sinatra::Base
  get '/foo' do
    "foo\n"
  end

  get '/bar' do
    "bar\n"
  end
end

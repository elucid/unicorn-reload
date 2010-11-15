require 'rubygems'
require 'bundler/setup'

require 'sinatra/base'
require 'fastercsv'

class App < Sinatra::Base
  get '/foo' do
    "foo\n"
  end

  get '/bar' do
    "bar\n"
  end

  get '/fcsv' do
    FasterCSV.parse("one,two,fcsv").last.last + "\n"
  end
end

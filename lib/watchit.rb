require "watchit/version"
require 'sinatra/base'

module Watchit
    class WatchitApp < Sinatra::Application
        get '/' do
            'Hello my dear friend!'
        end

        run!
    end
end

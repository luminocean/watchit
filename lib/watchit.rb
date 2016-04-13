require "watchit/version"

module Watchit
    def run
        p 'This is a test run!'
    end

    module_function :run
end

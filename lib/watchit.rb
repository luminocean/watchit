require "watchit/version"
require 'sinatra/base'

require 'watchit/injection'

module Watchit
    class WatchitApp < Sinatra::Application
        include Watchit::Injection

        get '/*' do
            # 请求路径
            request_file_path = params[:splat][0]
            # 文件实际位置
            location = File.expand_path request_file_path, Watchit::Watch_path
            # 扩展名
            regex_start = (/.*\.(\w+)/ =~ request_file_path)

            # 为html文件插入js脚本
            if regex_start != nil && $1 == 'html'
                file = File.open location
                content = file.read
                file.close

                content_type :html
                # 注入文本
                inject content
            # 不需要插入，直接返回
            else
                send_file location
            end
        end

        # 启动服务器
        run!
    end
end

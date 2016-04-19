require "watchit/version"
require 'sinatra/base'
require 'watchit/injection'
require 'erb'

module Watchit
    class WatchitApp < Sinatra::Application
        include Watchit::Injection

        get '/' do
            file_list = Dir.entries(Watchit::Watch_path)
                .select{|name| !name.start_with? '.'}
            erb :file_list, :locals => {
                :file_list => file_list
            }
        end

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
            # 不需要插入，直接返回文件内容
            else
                send_file location
            end
        end

        # 启动服务器
        run!
    end
end

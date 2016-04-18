require "watchit/version"
require 'sinatra/base'

module Watchit
    class WatchitApp < Sinatra::Application
        insert_exts = %w{html}

        get '/*' do
            # 请求路径
            request_file_path = params[:splat][0]
            # 文件实际位置
            location = File.expand_path request_file_path, Watchit::Watch_path
            # 扩展名
            regex_start = (/.*\.(\w+)/ =~ request_file_path)

            # 有扩展名且扩展名在待插入列表中，需要插入内容
            if regex_start != nil && insert_exts.include?($1)
                "under insertion => #{location}"
            # 不需要插入，直接返回
            else
                send_file location
            end
        end

        # 启动服务器
        run!
    end
end

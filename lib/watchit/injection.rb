require 'watchit/file_system'

module Watchit
	module Injection
		include Watchit::FileSystem

		# 向给定html文本中注入自动刷新html脚本
		def inject(raw_html)
			insert_index = (/<\/body>/ =~ raw_html)
			raw_html.insert insert_index, "<script>#{auto_refresh_script}</script>"
		end

		# 获取自动刷新js脚本代码
		def auto_refresh_script
			script_file = File.open File.expand_path('../auto_refresh.js', __FILE__)

			# 监视路径的修改时间
			mtime = dir_mtime Watchit::Watch_path
			time_str = "#{mtime.year}/#{mtime.month}/#{mtime.day}/#{mtime.hour}/#{mtime.min}/#{mtime.sec}"

			script = script_file.read
			script = script.sub(/{{MODIFIED_TIME}}/, time_str)
			 				.sub(/{{WATCHING_PATH}}/, Watchit::Watch_path)# 设置修改时间

			script_file.close
			return script
		end
	end
end

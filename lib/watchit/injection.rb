module Watchit::Injection
	# 向给定html文本中注入自动刷新html脚本
	def inject(raw_html)
		insert_index = (/<\/body>/ =~ raw_html)
		raw_html.insert insert_index, "<script>#{auto_refresh_script}</script>"
	end

	# 获取自动刷新js脚本代码
	def auto_refresh_script
		script_file = File.open File.expand_path('../auto_refresh.js', __FILE__)
		mtime = script_file.mtime
		time_str = "#{mtime.year}/#{mtime.month}/#{mtime.day}/#{mtime.hour}/#{mtime.min}/#{mtime.sec}"

		script = script_file.read
		script = script.sub(/{{MODIFIED_TIME}}/, time_str) # 设置修改时间

		script_file.close
		return script
	end
end

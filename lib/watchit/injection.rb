module Watchit::Injection
	def inject(raw_html)
		insert_index = (/<\/body>/ =~ raw_html)
		raw_html.insert insert_index, "<script>#{auto_refresh_script}</script>"
	end

	def auto_refresh_script
		script_file = File.open File.expand_path('../auto_refresh.js', __FILE__)
		script = script_file.read
		script_file.close
		return script
	end
end

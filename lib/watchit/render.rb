module Watchit
	module Render
		def file_list_html(path)
			file_list = Dir.entries(path)
                .select{|name| !name.start_with? '.'}
            erb :file_list, :locals => {
				:path => path,
                :file_list => file_list
            }
		end
	end
end

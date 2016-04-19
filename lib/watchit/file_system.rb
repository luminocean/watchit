module Watchit
	module FileSystem
		def dir_mtime(dir_name)
			old_dir = Dir.pwd
			Dir.chdir dir_name

			# 最新修改时间
			lastest = Time.at(0)

			file_names = Dir.entries('.').select{|name| !name.start_with? '.'}
			file_names.each do |file_name|
				next if File.symlink? file_name # 忽略软连接

				# 普通文件
				if !File.directory?(file_name)
					mtime = File.mtime file_name
				# 目录
				else
					mtime = dir_mtime file_name
				end

				lastest = mtime if lastest < mtime
			end

			def lastest.serilize
				"#{self.year}/#{self.month}/#{self.day}/#{self.hour}/#{self.min}/#{self.sec}"
			end

			Dir.chdir old_dir
			return lastest
		end
	end
end

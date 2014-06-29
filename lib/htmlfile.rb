#HtmlFile class takes a name of a file, checks to see if it .htm or .html extesion then performs actions on the file before closing it and returning true for success or false for a error
#Martin Calvert (sdla)
#martin@martin-calvert.com
#Martin-Calvert

class HtmlFile
	attr_accessor :file_name,:line_number
	@comment_lines=[]

	def self.extensions
		return [".htm",".html"]
	end


	def initialize(htmlfile_name)
		if HtmlFile.extensions.include?(File.extname(htmlfile_name))
			@file_name=htmlfile_name
			handle_file
		else 
			return false
		end
	end

	def handle_file
		line_number=0
		comment_lines=
		file=File.open(@file_name,'r+')
		file.each_line do |line|
			line++
			line.include?('<!--'&&'-->')
				
			
		end
		file.close
	end
end

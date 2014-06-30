#HtmlFile class takes a name of a file, checks to see if it .htm or .html extesion then performs actions on the file before closing it and returning true for success or false for a error
#Martin Calvert (sdla)
#martin@martin-calvert.com
#Martin-Calvert

class HtmlFile
	attr_accessor :file_name,:line_number
	@comment_lines={}
	@lines=[]

	def self.extensions
		return [".htm",".html"]
	end


	def initialize(htmlfile_name)
		@lines=[]
		@comment_lines={}
		if HtmlFile.extensions.include?(File.extname(htmlfile_name))
			@file_name=htmlfile_name
			handle_file
		else 
			return false
		end
	end

	def handle_file
		line_number=0
		
		file=File.open(@file_name,'r+')
		file.each do |line|
			line_number+=1
			if line.include?('<!--'&&'-->')
				comment_line=line.delete('<!--'&&'-->')
				comment_line.delete!('!')
				comment_line.strip
				@comment_lines.merge!(line_number=>comment_line)
			end
			@lines << line
		end
		file.rewind
		file.puts '<!-- Table Of Contents'
		@comment_lines.each do |k,v|
			file.puts "Line - #{k} #{v}"
		end
		file.puts '-->'
		@lines.each do |val|
			file.puts val
		end
		file.close
	end
end

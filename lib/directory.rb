#Directory Class holds the directory and creates the necessary file objects to work through the directory
#Martin Calvert (sdla)
#martin@martin-calvert.com
#Martin-Calvert.com

require 'htmlfile'

class Directory
	@directory_path
	@files=[]
	@html_files=[]
	@html=[]
	def initialize(path_name)
		@directory_path=path_name
		@html_files=[]
		@file=[]
		@html=['.htm','.html','.php']
		handle_directory
		
	end

	def handle_directory
		@files=Dir.entries(@directory_path)
		@files.each do |file|
			if @html.include?(File.extname(file))
				html_file=HtmlFile.new("#{@directory_path}#{file}")
				html_file=nil
			end
		end
	end
end

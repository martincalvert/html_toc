#html_toc
#This gem will take a directory or file as a argument then put a table of contents in each HTML file based on that files html comments
#Martin Calvert 
#martin@martin-calvert.com
#Martin-Calvert.com

APP_ROOT = File.dirname(__FILE__)

$:.unshift(File.join(APP_ROOT,'lib'))
require "htmlfile"
require "directory"

if File.directory?(ARGV[0])
	directory=Directory.new(ARGV[0])
elsif File.file?(ARGV[0])
	if HtmlFile.extensions.include?(File.extname(ARGV[0]))
		file=HtmlFile.new(ARGV[0])
	else
		puts "That is not a .htm or .html file"
		puts "Quitting"
	end
else
	puts "That is not a file or directory..."
	puts "Try again"
	puts "Quitting"
end

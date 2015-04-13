#!/usr/bin/env ruby

# try to determine the root of the project
# if there's .git, then bail
if !(Dir.exists? '.git')
	print "Can't find project root. Either in the wrong directory, or the project isn't under source control.\n"
	abort
end

if !(File.exists? '.clang-format')
	print "There is no .clang-format at the project root to apply\n"
	abort
end

require 'fileutils'

if (!File.exists? ".excludeFromFormatting")
	# we most certainly do not want to autoreformat cocoapods
	if (Dir.exists? 'Pods')
		tempFile = File.open(".excludeFromFormatting", 'w')
		tempFile.write("Pods/\n")
		tempFile.close
	end
end

directoriesToExclude = []
if (File.exists? ".excludeFromFormatting")
	exclusionFile = File.open(".excludeFromFormatting", 'r')
	exclusionFile.each_line { |line|
		if line.chomp.length > 0
			directoriesToExclude << line.chomp
		end
	}
	exclusionFile.close
end

candidateFileSpec = File.join("**", "*.{h,m}")
candidateFiles = Dir.glob(candidateFileSpec)       

# yeah. totally not efficient. TODO
candidateFiles.each do |candidate|
	if !(candidate.start_with?(*directoriesToExclude))
		`clang-format -i -style=file #{candidate}`
	end
end

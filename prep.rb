#!/usr/bin/env ruby

# try to determine the root of the project
# if there's .git, then bail
if !(Dir.exists? '.git')
	print "Can't find project root\n"
	abort
end

require 'fileutils'

print "Installing clang-format\n"
system("brew install clang-format")

scriptDirectory = File.dirname(__FILE__) 

binDirectory = File.join(ENV['HOME'], "bin")
gitLangFile = File.join(binDirectory, "git-clang-format")
if !(File.exists? gitLangFile)
	if !(Dir.exists? binDirectory)
		print "Creating $HOME/bin directory\n"
		FileUtils.mkdir_p binDirectory
	end

    FileUtils.cp(File.join(scriptDirectory, "git-clang-format"), gitLangFile)
    system("chmod +x #{gitLangFile}")
    print "Installed git clang-format\n"
end

if (File.exists? '.clang-format')
	print ".clang-format already exists and will not be overridden\n"
else
	configFile = File.join(scriptDirectory, "clang-format")
    FileUtils.cp(configFile, "./.clang-format")
	print "copied .clang-format to project root\n"
end

if (File.exists? '.git/hooks/pre-commit')
	print "A pre-commit hook already exists. Don't know how to handle this\n"
	abort
else
	precommitHookFile = File.join(scriptDirectory, "check_formatting.sh")
    FileUtils.cp(precommitHookFile, ".git/hooks/pre-commit")
    system("chmod +x .git/hooks/pre-commit")
    print "Installed pre-commit hook\n"
end

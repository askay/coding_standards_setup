# Coding standards setup

If you want to quickly set up code style standards, particularly with git, this project will help you get started.

Assuming that you have brew installed. If you don't: [what needs to be done]

# Set up
1. Download this project locally. 
2. Configure the file clang-format to your liking. (Note the lack of the period prefix.) Please refer to http://clang.llvm.org/docs/ClangFormatStyleOptions.html for more information on configuring this file. You really ought to do this—my tastes and yours likely diverge.
3. Then from the project you want to set up:

	[path to]/coding_standards_setup/prep.rb

Here's what will happen:

1. A copy of .clang-format will be placed at the root of your project.
2. A git pre-commit hook will be installed if possible. This will check whether any new code complies with the standards. If not, the commit will be blocked.

# How do I style my entire project?
*PROCEED WITH CAUTION*
Consider how doing so will affect any other branches in progress. If you’re confident this will cause minimal disruption, from a clean branch:

	[path to]/coding_standards_setup/apply_styles.rb

You can exclude directories by creating a .excludeFromFormatting file at the project root and listing them in the file, one line per directory. If there isn’t a .excludeFromFormatting present, CocoaPods pods will be excluded automatically; delete the entry to reformat them as well. 

See below about dealing with merge conflicts.

# Oh, no, my commit was blocked. Now what?

From the command line, run 

	git clang-format 

to automatically reformat the text.

If you’re using Xcode, you might consider installing [BBUncrustifyPlug-Xcode][1] or [ClangFormat-Xcode][2] (use [Alcatraz][3]) and setting them up to update your files on saving.

# Oh, no, I applied styles to the whole project and I have  conflicts merging into my other branches. Now what?

*PROCEED WITH CAUTION*
Resolve the conflicts. If you’re certain that you didn’t make any actual code changes in the branch you’re merging from, you can simply resolving using Mine, and then reapply the styles.

# Dude, what’s up with the Ruby *and* Python?
Yeah. That. Right.

# Acknowledgements
Many thanks to Mike Rhodes for his [blog post][4] and the initial check\_formatting.sh on which this project's version is based.

[1]:	https://github.com/benoitsan/BBUncrustifyPlugin-Xcode
[2]:	https://github.com/travisjeffery/ClangFormat-Xcode
[3]:	http://alcatraz.io
[4]:	http://www.dx13.co.uk/articles/2015/04/03/Setting-up-git-clang-format.html
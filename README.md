# coding\_standards\_setup

If you want to quickly set up code style standards, particularly with git, this project will help you get started.

Assuming that you have brew installed. If you don't: [what needs to be done]

# Set up
Download this project locally. Then from the project you want to set up:

[path to ]/coding\_standards\_setup/prep.rb

Here's what will happen:
1. A copy of .clang-format will be placed at the root of your project.
   Please refer to http://clang.llvm.org/docs/ClangFormatStyleOptions.html for
   more information on configuring this file
2. A git pre-commit hook will be installed if possible. This will check
   whether any new code complies with the standards. If not, the commit will be blocked.

# Oh, no, my commit was blocked. Now what?

Run 

	git clang-format 

to automatically reformat the text.


# Acknowledgements
Many thanks to Mike Rhodes for his [blog post][1] and the initial check\_formatting.sh on which this project's version is based.

[1]:	http://www.dx13.co.uk/articles/2015/04/03/Setting-up-git-clang-format.html
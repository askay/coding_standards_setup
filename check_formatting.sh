#!/usr/bin/env python

# clang-format is in the user's bin directory; however apps don't inherit the same paths that
# shells do. so we need to manually add it. 
import sys
sys.path.append("~/bin")

# when run from within an app (e.g. SourceTree), subprocess will throw an exception because
# of the error from git clang-format. we'll ignore that to carry on
import subprocess
output = ""
try:
    output = subprocess.check_output(["git", "clang-format", "--diff"], shell=True)
except subprocess.CalledProcessError:
    pass

if output not in ['no modified files to format\n', 'clang-format did not modify any files\n']:
    print "Run git clang-format, then commit.\n"        
    exit(1)
else:
    exit(0)

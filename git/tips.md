1. remove a submodule

http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule

To remove a submodule you need to:

    Delete the relevant line from the .gitmodules file.
    Delete the relevant section from .git/config.
    Run git rm --cached path_to_submodule (no trailing slash).
    Commit and delete the now untracked submodule files.

2. Undoing in Git - Reset and Revert
http://book.git-scm.com/4_undoing_in_git_-_reset_and_revert.html

git reset --hard HEAD



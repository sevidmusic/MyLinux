# Steps to set up a bare git repo:

### Remote Steps

Login to github, create a new repository WITHOUT ANY INITIAL FILES
to host the bare repo.

### Local Steps

# 1. Create an empty directory for the bare git repo

`mkdir ~/.MyLinux`

# 2. Initialize the bare repo

`git init --bare $HOME/.MyLinux`

# 3. Add the following alias to appropriate configuration file,
#    for example: .bash-aliases

`alias mylinux='/usr/bin/git --git-dir=$HOME/.MyLinux/ --work-tree=$HOME'`

# 3.a Make sure to source the releveant configuration file to enable
#     new alias.

# 4. Make sure to set the following git configuration to make sure
#    untracked files are not shown, forgetting to this will make it
#    very hard to look at git status and git diff because EVERY
#    UNTRACKED FILE in your $HOME directory will be shown!

`mylinux config --local status.showUntrackedFiles no`


# 5. Push to remote (Must already exist WITHOUT README)

`mylinux remote add origin https://github.com/USERNAME/REPO_NAME.git`



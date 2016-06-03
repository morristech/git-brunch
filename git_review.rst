git-brunch - git-review
=======================

git-review allows to easily submit and download changes from Gerrit, without
using the git-Repo tool.

It is suitable for:

* small-size projects, or to work with uncorrelated repositories
* developers comfortable with Git operations: feature branches, rebase & merge,
  solving conflicts

Installation
------------

`git-review <https://pypi.python.org/pypi/git-review/1.25.0>`_
is a Python utility available on PyPi (preferred to the OS's package which
may be outdated).

System-wide installation via pip (latest version):

::

   $ sudo apt-get install python-pip
   $ sudo pip install git-review

System-wide installation via the distribution's packages (may be outdated):

::

   $ sudo apt-get install python-pip git-review


Configuration
-------------

git-review >= 1.25
^^^^^^^^^^^^^^^^^^

Add to ``~/.gitconfig``:

::

   [user]
   name = Jane Doe
   email = jane.doe@domain.tld
    
   [gitreview]
   remote = origin
    
   ...

git-review < 1.25
^^^^^^^^^^^^^^^^^

Create ``~/.config/git-review/git-review.conf``:

::

   [gerrit]
   defaultremote = origin

Usage
-----

First, clone a Git repository:

::

   $ git clone ssh://gerrit.domain.tld:29418/my-repository
   $ cd my-repository
 
Install the Git hook for Gerrit:

::

   $ git review -s

List pending reviews:

::

   $ git review -l
   466183  master  hotfix: call foo.baz() instead of foo.bar()
   475424  master  ui: increment the kitten picture ratio
   474917  master  draft: try this shiny new library

Create and submit a patch on Gerrit:

::

   # create a topic-branch, make some modifications
   $ git checkout -b my/topic/branch
   $ vim settings.py
    
   # create a commit
   $ git add settings.py
   $ git commit -s
    
   # submit the changes for review
   $ git review
    
   # code review happens: make some additional changes
   $ vim my_lib/my_module.py
    
   # amend the commit
   $ git add my_lib/my_module.py
   $ git commit --amend
    
   # re-submit the changes
   $ git review

Download a patch from Gerrit:

::

   # download a change
   #  - create and checkout a new branch
   #  - cherry-pick the patch and its dependencies
   $ git review -d 133910
   Downloading refs/changes/10/133910/15 from gerrit
   Switched to branch "review/patch_owner/patch_topic"

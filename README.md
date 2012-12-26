[![Build Status](https://secure.travis-ci.org/pivotal/pivotal_workstation.png)](http://travis-ci.org/pivotal/pivotal_workstation)

Pivotal Workstation: A Repeatable, Documented, Decomposable, Shareable and Iterative OSX (ruby) Development Environment

# NOTICE
Pivotal Workstation is moving to using community cookbooks, and now depends on [opscode-cookbooks/dmg](https://github.com/opscode-cookbooks/dmg).  You will need to clone the dmg cookbook alongside pivotal_workstation.

	cd ~/cookbooks; git clone https://github.com/opscode-cookbooks/dmg

# Why?

It takes a long time to set up a workstation, and doing it by hand leads to as many different setups as you have workstations.  Pivotal Workstation automates the  installation the applications you want (the canned ones, e.g. Chrome, Firefox, RubyMine, as well as the compiled ones, i.e. homebrew's suite) and tweaks the settings you usually set by hand.  Pivotal Workstation automates the process so you can decide what you want your machine to look like then do other things while your workstation chugs away, downloading, compiling, installing and configuring.

# OK, I'm ready to dive in. How should I use this?

First, make sure you've got Xcode and the Xcode command line tools installed, then:

- [SoloWizard](http://www.solowizard.com/)

	This is the easiest way to get started, and it only involves cutting-and-pasting one line.  Many thanks to [Tom Hallett](https://github.com/tommyh/).
	
- [soloistrc builder](http://soloistrc-builder.herokuapp.com/)
	
	Soloistrc Builder can be pointed at any cookbook and will help you build a soloistrc. Many thanks to [Winston Teo](https://github.com/winston/).

# Background

Development environments are very personal, yet pairing requires some standard be agreed upon.  Traditionally, Pivotal relied on imaging workstations from a gold master image which was updated as time allowed.  Creating an image that satisfies everyone is impossible, and creating one that satisfies most people is a time consuming process which happened when Apple happened to release hardware which was not compatible with the old image.  Chef and the Pivotal Workstation cookbook allows bringing up a new rails development environment with almost no effort, decide on standards on a per-project basis, then share changes with the rest of the users of the pivotal_workstation cookbook as time goes on.  Another motivation was to reduce the amount of time spent at standup discussing how to get xyz to compile/run/launch/work in development.

# I'm just setting up my laptop, this all sounds like overkill.
It might be, but it's probably not.  Have you ever spent hours trying to get the mysql gem to compile?  Do you go to RVM's home page to figure out how to install it?  What about homebrew?  Do you not test SSL on your local machine because getting nginx set up with a self signed certificate would take most of the morning?  Do you fear setting up a new machine because you'll spend a week running into things you vaguely remember how to fix?

# Ok, what exactly do I get?
Anything you want, nothing you don't.  Packages are built with Homebrew, Ruby is installed with RVM.  See the [recipes folder](https://github.com/pivotal/pivotal_workstation/tree/master/recipes) for a complete list.  Many recipes require homebrew or overwriting your .bash_profile.  If you want something that doesn't have a recipe, write one and make a pull request.

# Hey, I'm attached to my .bash_profile, isn't this dangerous?
Yes.  Chef needs to be run as root - it can do whatever it wants to your system.  The recipes have to make some hard assumptions about your machine, and take over parts of your system.  Reading any recipe you're thinking of using is a very good idea - a chef recipe shouldn't be difficult to follow, and it'll give you an idea of how to make your own.  In the case of your bash profile, it'll be backed up by chef (to /var/chef/backup), and you can move it into ~/.bash_profile_includes/ and it will be sourced by the provided .bash_profile.

# I want to write my own recipe, what should I know?
Soloist (or your preferred method of running chef) usually runs chef-solo as root.  This means the current user is root, and ~ will be expanded to root's home directory.  Some constants, WS_USER and WS_HOME are available when needed.

# I'm still running Lion; I haven't upgraded to Mountain Lion
The current version is tested only tested on Mountain Lion (OS X 10.8); [Here](https://github.com/pivotal/pivotal_workstation/zipball/last_lion_release) you'll find the last release we tested on Lion (OS X 10.7).

# Does this thing actually work?
Yes.  At Pivotal we take testing seriously, and have all projects under CI. Occasionally dependencies outside of our control disappear between times we are working on pivotal_workstation.  If you come across something which has broken, we welcome pull requests.

# Forking and Pull Requests
Pull requests are welcomed.  Creating a cookbook to keep along side pivotal_workstation allows for easy separation between personal/project metadata/recipes and recipes that are of general utility.

Chef node attributes allow for easy overriding in your own cookbook.  All attributes in pivotal_workstation are set at the default level, so you may simply set node.normal or node.override in your own cookbook.  We don't tend to extract node attributes preemptively, but pull requests extracting a node variable so you can override it in your own cookbook are welcomed.

If you are making a pull request, please make your changes on a branch, rebase them to master of pivotal_workstation and open a pull request.

# To Whom do I complain?
pivotal_workstation started as a side project of [Matthew Kocher](https://github.com/mkocher) and [Steve Conover](https://github.com/sconover) of Pivotal Labs in 2009, and made the move to a supported pivotal project at the beginning of 2010. [Brian Cunnie](https://github.com/briancunnie) now wrangles the many developers at Pivotal Labs who contribute and keeps the project going.

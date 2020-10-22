# Initalize git in directory where you want to clone repo
 	
	git init 

# Add origin 
	
	git remote add origin https://eldotal@bitbucket.org/eldotal/myosx_setup.git
	
# Make sure correct origin was added 

	git remote -v 

# Clone repo https 

	git clone 'repo url'
	git clone -b 'branch_name' 'repo url'		# clone a specific branch

# Add, commit, push, pull changes = sync with local & remote repos

	git stash 		# save your local changes 
	git pull   	 	# update local copy with latest code 
	git stash apply	        # merge changes with your local code 
		# then the usual:git add, commit, push.. 

	git add . 				# stage all '.' changes 
        git reset 				# reset all changes
       	git commit -m "message"			# commit changes with message of changes
	git reset HEAD~				# undo a commit
	git push origin master 		        # push all changes from origin to master remote 

	git update && git status 		# get update of remote and local repo, show changes
	git pull origin master			# pull changes from remote to local repo 

	git remote -v				# list origin (local) repo name; default is origin
	git remote rename origin whatevername	# renames origin to whatevername 	
	

# OTHER useful git commands

	git branch -d 'branch_name' 		 # delete a local branch; -d = delete only if merged with upstream branch
	git branch -D 'branch_name'		 # -D = force delete,deletes branch irrespective of merge status 

	git branch -a		   		 # list all branches (including cloned remote branches)
	git checkout origin/'branch_name'	 # peek at upstream branch 
	git checkout 'branch_name'		 # create local tracking and work on remote branch 
	
	git remote remove 'name' 		 # git remote remove

# But there are other branches hiding in your repository! You can see these using the -a flag:

	 git branch -a
	* master
	  remotes/origin/HEAD
	  remotes/origin/master
	  remotes/origin/v1.0-stable
	  remotes/origin/experimental

# If you just want to take a quick peek at an upstream branch, you can check it out directly:

	 git checkout origin/experimental

# But if you want to work on that branch, you'll need to create a local tracking branch which is done automatically by:

	 git checkout experimental
	 # and you will see

	`Branch experimental set up to track remote branch experimental from origin.
	Switched to a new branch 'experimental'`
	

	# SET UP SSH as it is more secure 

	cd ./ssh 
	mkdir id_rsa
				#make new private public key pair 
	ssh-keygen -t rsa 	#use passphrase you can remember 
				#when prompted chose a name for private/pub key = my_rsa 
	ssh-add my_rsa
	mv my_rsa* /id_rsa	#move keys to id_rsa direcotry 	
	pbcopy < my_rsa.pub	#copy public key; add to bitbucket or github
	
	vim config 		#create a config to provide different hosts 
	
	# add following:
	Host bitbucket.org
	  HostName bitbucket.org
	  IdentifyFile ~/.ssh/my_rsa

	Host github.com
	  HostName github.com
	  IdentifyFile ~/.ssh/work
      UseKeychain yes # add this to having to avoid having to put in the passhprase every time

	# add passphrase to keychain; avoid having to provide every time

	ssh add -K


#FOR HTTPS connections:
# Set up git username and email

	git config --global user.name "Eldo"
	git config --global user.email "eldin.talundzic@icloud.com"

# Set up keychain for git (push/pull) so there is no need to type it every time

	git credential-osxkeychain

# If you get usage output credential-osxkeychain was installed correctly with brew
# Configure git to use the osxkeychain 
# Next time you input u/p it will be stored in keychain cache

	git config --global credential.helper osxkeychain	

# If it not installed and you get no usage output and/or error:

	curl -O http://github-media-downloads.s3.amazonaws.com/osx/git-credential-osxkeychain
        sudo mv git-credential-osxkeychain /usr/local/bin/
    	chmod u+x /usr/local/bin/git-credential-osxkeychain	
	
# Above will download the keychain helper, move it to /usr/local/bin and make it executable

# Tell git to use vim as global text editor

	git config --global core.editor vim



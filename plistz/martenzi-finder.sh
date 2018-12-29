#!/bin/bash
#
#   by Martenzi @ 2018-05-18
#
#   - credits to:
#       Joris Berthelot 
#       	URL: https://blog.eexit.net/osx-dealing-with-property-list-files/ (2015-05-03)
#       "Fotis"
#       	URL: https://fgimian.github.io/page/about/ (2015)
# 		Armin Briegel (2017)
# 			Ebook: “Property Lists, Preferences and Profiles for Apple Administrators" (2017)
# 
# 
#   Syntax of PlistBuddy (PlB)
#
#	$/usr/libexec/PlistBuddy file.plist​  -c "[command]"
#
#	Print, set or add value​ :
#   $/usr/libexec/PlistBuddy file.plist​  -c "print|set|add key"
#
# 	Print, set or add item of an array (index starts at 0):
#   $/usr/libexec/PlistBuddy file.plist -c "print|set|add :item1:0"
#
# 	Print, set or add dictionary subkey​ 
#   $/usr/libexec/PlistBuddy file.plist -c "print|set|add :dictkey:subkey”
#
#   As PlB is typically not in your $PATH, you can either:	
#	- add '/usr/libexec/PlistBuddy' to $PATH 
#	- use full path to PlB (like above)
#	- or create aliases/variables to abbreviate PlB path and/or your plist file:
#	
#   	myVarPlB=/usr/libexec/PlistBuddy
#   	myVarPath=/path/to/plist
#--------------------------------------------------------------------------------------------------------

###	--- Start of Script --- ###

#	Create a variable/alias to help expand path to plistbuddy executable
#-------------------------------------------------------------------------
plistbuddy=/usr/libexec/plistbuddy

#	Create a variable/alias to help expand path to Path Finder preference plist file
#-------------------------------------------------------------------------
finder=~/Library/Preferences/com.apple.finder.plist


#####################################################################
#																	#
# 					⬇︎ Standard View Settings (Command+J) 			#	
#																	#
#####################################################################

#	Always open in (x) view:	x 	= 1
#								y 	= 2
#								z 	= 3
#-------------------------------------------------------------------------




#####################################################################
#																	#
# 					⬇︎ General Preferences tab 						#	
#																	#
#####################################################################

#   Show Hard Disks on Desktop			 (true/false)
#-----------------------------------------------------
$plistbuddy $finder -c "add :ShowExternalHardDrivesOnDesktop bool true"
$plistbuddy $finder -c "set :ShowExternalHardDrivesOnDesktop true"

#   Show External Disks on Desktop			 (true/false)
#---------------------------------------------------------
$plistbuddy $finder -c "add :ShowHardDrivesOnDesktop bool true"
$plistbuddy $finder -c "set :ShowHardDrivesOnDesktop true"

#	Show CDs, DVDs and iPods on Desktop			  	 (true/false)
#-----------------------------------------------------------------
$plistbuddy $finder -c "add :ShowRemovableMediaOnDesktop bool true"
$plistbuddy $finder -c "set :ShowRemovableMediaOnDesktop true"

#	Show Connected Servers on Desktop 		 			  (true/false)
#----------------------------------------------------------------------
$plistbuddy $finder -c "add :ShowMountedServersOnDesktop bool true"
$plistbuddy $finder -c "set :ShowMountedServersOnDesktop true"


#	New Finder Windows show:							  (string)
#------------------------------------------------------------------
$plistbuddy $finder -c "add :NewWindowTargetPath string file:///Users/Kane"
$plistbuddy $finder -c "set :NewWindowTargetPath file:///Users/Kane"

#	Open Folders in Tabs instead of New Windows 	  (true/false)
#-----------------------------------------------------------------
$plistbuddy $finder -c "add :FinderSpawnTab bool true"
$plistbuddy $finder -c "set :FinderSpawnTab true"



#####################################################
#													#
#					⬇︎ Tags Tab						#
#													#
#####################################################

#	Show these Tags in the Sidebar 				  (array)
#--------------------------------------------------------
#$plistbuddy $finder -c "add :FavoriteTagNames array <N/A>"
#$plistbuddy $finder -c "set :FavoriteTagNames <N/A>"



#####################################################
#													#
#				⬇︎ Sidebar Tab 						#
#													#
#####################################################

#	ATTENTION:
#	Multiple options are hidden/not explicitly stated,
#	and will thus not be included.

#	Show Recent Tags in Sidebar    (true/false)
#----------------------------------------------------------------
$plistbuddy $finder -c "add :ShowRecentTags bool false"
$plistbuddy $finder -c "set :ShowRecentTags false"



#####################################################
#													#
#				⬇︎ Advanced tab						#
#													#
#####################################################

#	Hide Finders Desktop 				  (true/false)
#-----------------------------------------------------
$plistbuddy ~/Library/Preferences/com.apple.finder.plist -c "add :CreateDesktop bool false"
$plistbuddy ~/Library/Preferences/com.apple.finder.plist -c "set :CreateDesktop false"
killall Finder

#	Show all filename extensions 				(true/false)
#-----------------------------------------------------------
# $plistbuddy $finder -c "add :<N/A> bool true"
# $plistbuddy $finder -c "set :<N/A> true"

#	Show warning before changing an extension 		(true/false)
#-----------------------------------------------------------------
$plistbuddy $finder -c "add :FXEnableExtensionChangeWarning bool true"
$plistbuddy $finder -c "set :FXEnableExtensionChangeWarning true"

#	Show warning before removing from iCloud Drive 			(true/false)
#-----------------------------------------------------------------------
$plistbuddy $finder -c "add :FXEnableRemoveFromICloudDriveWarning bool true"
$plistbuddy $finder -c "set :FXEnableRemoveFromICloudDriveWarning true"

#	Show warning before emptying the Trash 	  (true/false)
#---------------------------------------------------------
$plistbuddy $finder -c "add :WarnOnEmptyTrash bool false"
$plistbuddy $finder -c "set :WarnOnEmptyTrash false"

#	Remove item from the Trash after 30 days 	(true/false)
#-----------------------------------------------------------
$plistbuddy $finder -c "add :FXRemoveOldTrashItems bool false"
$plistbuddy $finder -c "set :FXRemoveOldTrashItems false"

#	Keep folders on Top when sorting by Name 	(true/false)
#-----------------------------------------------------------
$plistbuddy $finder -c "add :_FXSortFoldersFirst bool true"
$plistbuddy $finder -c "set :_FXSortFoldersFirst true"


#	When performing a search:	Search This Mac 				= SCev
#								Search Current Folder 			= SCcF
#								Use the Previous Search Scope 	= SCsp
#-------------------------------------------------------------------------
$plistbuddy $finder -c "add :FXDefaultSearchScope string SCcF"
$plistbuddy $finder -c "set :FXDefaultSearchScope SCcF"
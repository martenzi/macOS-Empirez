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
pf=~/Library/Preferences/com.cocoatech.PathFinder.plist

# EXPERIMENTAL!!

# 	Options for top toolbar
# {"NTFileBrowserDocument-FileWindow":"{{0, 582}, {960, 434}}"}
# $plistbuddy $pf -c "add :NTFileBrowserDocument-FileWindow string {{0, 556}, {960, 434}}"
# $plistbuddy $pf -c "set :NTFileBrowserDocument-FileWindow "{{0, 556}, {960, 434}}""

# $plistbuddy $pf -c "set :NSToolbar Configuration PF6_browserToolbarController:0:TB Is Shown: 2"
# {"TB Is Shown":1,"TB Size Mode":1,"TB Default Item Identifiers":["Back","NSToolbarFlexibleSpaceItem","View","Views","Quick Look","NSToolbarFlexibleSpaceItem","Arrange","NSToolbarFlexibleSpaceItem","Show Invisibles","NSToolbarFlexibleSpaceItem","Search","Progress"],"TB Item Identifiers":["Progress","Back","NSToolbarFlexibleSpaceItem","Path","Search","Find","New File","New Folder","NSToolbarFlexibleSpaceItem","Duplicate","Copy","NSToolbarFlexibleSpaceItem","Move","NSToolbarFlexibleSpaceItem","Reload","Show Invisibles","NSToolbarFlexibleSpaceItem","Trash","Move to Trash"],"TB Display Mode":1,"TB Icon Size Mode":1}

# {
#   "TB Is Shown": 1,
#   "TB Size Mode": 1,
#   "TB Default Item Identifiers": [
#     "Back",
#     "NSToolbarFlexibleSpaceItem",
#     "View",
#     "Views",
#     "Quick Look",
#     "NSToolbarFlexibleSpaceItem",
#     "Arrange",
#     "NSToolbarFlexibleSpaceItem",
#     "Show Invisibles",
#     "NSToolbarFlexibleSpaceItem",
#     "Search",
#     "Progress"
#   ],
#   "TB Item Identifiers": [
#     "Progress",
#     "Back",
#     "NSToolbarFlexibleSpaceItem",
#     "Path",
#     "Search",
#     "Find",
#     "New File",
#     "New Folder",
#     "NSToolbarFlexibleSpaceItem",
#     "Duplicate",
#     "Copy",
#     "NSToolbarFlexibleSpaceItem",
#     "Move",
#     "NSToolbarFlexibleSpaceItem",
#     "Reload",
#     "Show Invisibles",
#     "NSToolbarFlexibleSpaceItem",
#     "Trash",
#     "Move to Trash"
#   ],
#   "TB Display Mode": 1,
#   "TB Icon Size Mode": 1
# }

#####################################################################
#																	#
# 					⬇︎ General Preferences tab 						#	
#																	#
#####################################################################

#   Launch Path Finder at login 		 (true/false)
#-----------------------------------------------------
$plistbuddy $pf -c "add :kLaunchAfterLogin bool true"
$plistbuddy $pf -c "set :kLaunchAfterLogin true"

#   Show menu bar icon 						 (true/false)
#---------------------------------------------------------
$plistbuddy $pf -c "add :globalAppsMenuEnabled bool false"
$plistbuddy $pf -c "set :globalAppsMenuEnabled false"

#	Set PF as the default file browser 			  	 (true/false)
#-----------------------------------------------------------------
$plistbuddy $pf -c "add :pathFinderIsDefaultFileViewer bool true"
$plistbuddy $pf -c "set :pathFinderIsDefaultFileViewer true"

#	Open TextEdit documents with Path Finder 		 	  (true/false)
#----------------------------------------------------------------------
$plistbuddy $pf -c "add :kOpenTextEditDocumentsInTextEditor bool false"
$plistbuddy $pf -c "set :kOpenTextEditDocumentsInTextEditor false"

#	Open Word documents with Path Finder 			  (true/false)
#------------------------------------------------------------------
$plistbuddy $pf -c "add :kOpenWordDocumentsInTextEditor bool true"
$plistbuddy $pf -c "set :kOpenWordDocumentsInTextEditor true"

#	Open Images with Path Finder 					  (true/false)
#-----------------------------------------------------------------
$plistbuddy $pf -c "add :kOpenImageFilesInImageViewer bool false"
$plistbuddy $pf -c "set :kOpenImageFilesInImageViewer false"

#	Set <App> as Default Text Editor 														 
#--------------------------------------------------------------------------------------------------------
$plistbuddy $pf -c "add :textEditorApplicationPath string /Applications/Martenzi-Appz/Sublime\ Text.app"
$plistbuddy $pf -c "set :textEditorApplicationPath /Applications/Martenzi-Appz/Sublime\ Text.app"

#   Default Terminal 														    	(true/false)
#----------------------------------------------------------------------------------------------
$plistbuddy $pf -c "add :kTerminalApplicationPath string /Applications/Utilities/Terminal.app"
$plistbuddy $pf -c "set :kTerminalApplicationPath /Applications/Utilities/Terminal.app"

#	Updates 												  (true/false)
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :checkForUpdates bool true"
$plistbuddy $pf -c "set :checkForUpdates true"

#	Enable bug reporter 									  (true/false)
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :NTExceptionHandlerEnabled bool true"
$plistbuddy $pf -c "set :NTExceptionHandlerEnabled true"

#	Show warning before emptying the Trash and deleting 	  (true/false)
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :warnBeforeEmptyTrash bool false"
$plistbuddy $pf -c "set :warnBeforeEmptyTrash false"


#####################################################
#													#
#					⬇︎ Browser Tab					#
#													#
#####################################################

#	Starting Directory 										  (true/false)
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :kNTDefaultTabPath string /Volumes/Spacex"
$plistbuddy $pf -c "set :kNTDefaultTabPath /Volumes/Spacex"

#	Command clicking folders:	Open folder in new window 	= 0							
#								Open folder in new tab 		= 1
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :kCommandClickOpenBehavior integer 1"
$plistbuddy $pf -c "set :kCommandClickOpenBehavior 1"

#	Reveal in Path Finder:	Reveal in existing window 	= 0
#							Reveal in new window 		= 1
#							Reveal in new tab 			= 2
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :kRevealInPathFinderBehaviorPrefKey integer 2"
$plistbuddy $pf -c "set :kRevealInPathFinderBehaviorPrefKey 2"

#	Open new windows and tabs in:	Icon view 		= 2
#									List view 		= 
#									Column view 	= 4
#									Last shown view = 0
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :kNTNewWindowsViewType integer 0"
$plistbuddy $pf -c "set :kNTNewWindowsViewType 0"

#	Open new browser on launch
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :kOpenNewBrowserOnLaunch bool false"
$plistbuddy $pf -c "set :kOpenNewBrowserOnLaunch false"

#	Arrow keys loop around when reaching end
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :kArrowKeysLoopAround bool true"
$plistbuddy $pf -c "set :kArrowKeysLoopAround true"

#	Double-click when clicking icon
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :doubleClickWhenClickingIcon bool true"
$plistbuddy $pf -c "set :doubleClickWhenClickingIcon true"

#	File size calculation:	Base 10 = 0
#							Base 2 	= 1
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :useBase2MathForSizes integer 0"
$plistbuddy $pf -c "set :useBase2MathForSizes 0"

#	Spring-loaded folders
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :kSpringLoadedFolders bool true"
$plistbuddy $pf -c "set :kSpringLoadedFolders true"

#	Restore location after spring-loaded drag
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :restoreLocationAfterDrag bool true"
$plistbuddy $pf -c "set :restoreLocationAfterDrag true"

#	Smart Sort order:	Applications =
#						Packages	 =
#						Folders 	 =
#						Files 		 =
# {"type":0,"enabled":bool true}
# $plistbuddy $pf -c "add :restoreLocationAfterDrag bool true"
# $plistbuddy $pf -c "set :restoreLocationAfterDrag true"
# $plistbuddy $pf -c "add :restoreLocationAfterDrag bool true"
# $plistbuddy $pf -c "set :restoreLocationAfterDrag true"
# [
#   {
#     "type": 0,
#     "enabled": true
#   },
#   {
#     "type": 1,
#     "enabled": true
#   },
#   {
#     "type": 2,
#     "enabled": true
#   },
#   {
#     "type": 3,
#     "enabled": true
#   }
# ]


#####################################################
#													#
#				⬇︎ Appearance Tab 					#
#													#
#####################################################

#	Use larger font for browser controls 	  (true/false)
#---------------------------------------------------------
$plistbuddy $pf -c "add :useLargeAppearanceMode bool true"
$plistbuddy $pf -c "set :useLargeAppearanceMode true"

#	Hide Tab Bar when there is a single tab    (true/false)
#----------------------------------------------------------
$plistbuddy $pf -c "add :hideTabBarForSingleTab bool false"
$plistbuddy $pf -c "set :hideTabBarForSingleTab false"

#	Position the Path Navigator below the browser    (true/false)
#----------------------------------------------------------------
$plistbuddy $pf -c "add :pathNavigatorBelowBrowser bool false"
$plistbuddy $pf -c "set :pathNavigatorBelowBrowser false"


#####################################################
#													#
#				⬇︎ Finders tab						#
#													#
#####################################################

#	Hide Finders Desktop 				  (true/false)
#-----------------------------------------------------
$plistbuddy ~/Library/Preferences/com.apple.finder.plist -c "add :CreateDesktop bool false"
$plistbuddy ~/Library/Preferences/com.apple.finder.plist -c "set :CreateDesktop false"
killall Finder

#	Quit Finder when Path Finder launches 		(true/false)
#-----------------------------------------------------------
$plistbuddy $pf -c "add :kQuitFinderWhenLaunched bool true"
$plistbuddy $pf -c "set :kQuitFinderWhenLaunched true"

#	Enable Finders 'Remove from Dock' menu option
#	Enable Trashes 'Remove from Dock' menu option
#-------------------------------------------------------------------------
#	ATTENTION: these options requires temporarily disabling macOS System Integrity Protection (SIP)
#				This is done by booting to recovery mode and follow instructions:
#	1. Boot into Recovery Mode by holding down Command+R until the Apple logo appears on your screen.
#	2. Click Utilities > Terminal.
#	3. In the Terminal window, type in csrutil disable and press Enter.
#	4. Restart your Mac.


#####################################################
#													#
#	 			⬇︎ Compression tab 					#
#													#
#####################################################

#	Default format:		.zip = 0	
#						.bz2 = 1
#		 	 			.gz  = 2
#--------------------------------------------------------------
$plistbuddy $pf -c "add :NTDefaultCompressionFormat integer 0"
$plistbuddy $pf -c "set :NTDefaultCompressionFormat 0"

# 	Dont compress Invisible files						(true/false)
#-------------------------------------------------------------------
$plistbuddy $pf -c "add :ignoreInvisibleFilesCompressing bool true"
$plistbuddy $pf -c "set :ignoreInvisibleFilesCompressing true"

#	Dont compress Resource forks 						(true/false)
#-------------------------------------------------------------------
$plistbuddy $pf -c "add :ignoreResourceForksCompressing bool false"
$plistbuddy $pf -c "set :ignoreResourceForksCompressing false"

#	Save Compressed files into same folder 	 		     (true/false)
#--------------------------------------------------------------------
$plistbuddy $pf -c "add :kCompressInSameDirectory bool true"
$plistbuddy $pf -c "set :kCompressInSameDirectory true"

#	Expand Decompressed files into same folder   	  		  (true/false)
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :kDecompressInSameDirectory bool true"
$plistbuddy $pf -c "set :kDecompressInSameDirectory true"

#	Expand archives with Path Finder 						  (true/false)
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :kDecompressWithPathFinder bool true"
$plistbuddy $pf -c "set :kDecompressWithPathFinder true"

#	Mount disk images after expanding with Path Finder 		  (true/false)
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :kMountDiskImagesAfterExpand bool true"
$plistbuddy $pf -c "set :kMountDiskImagesAfterExpand true"

#	Reveal expanded items in Path Finder 					  (true/false)
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :NTRevealExpandedItems bool false"
$plistbuddy $pf -c "set :NTRevealExpandedItems false"


#####################################################
#													#
# 					⬇︎ Network tab					#
#													#
#####################################################

#	Show icon previews on Network volumes 					  (true/false)
#-------------------------------------------------------------------------
$plistbuddy $pf -c "add :showIconPreviewsOnNetworkVolumes bool false"
$plistbuddy $pf -c "set :showIconPreviewsOnNetworkVolumes false"

#	Handle URLs
#-----------------------------------------------------------------------
#	ATTENTION: these options are not shown/written in regular plist file
#		"ftp://"
#		"afp://"
#		"file://"


#####################################################
#													#
#					⬇︎ Keyboard tab					#
#													#
#####################################################

#	Global hot-keys -> Reveal in Path Finder
#----------------------------------------------
# {"revealFKey":63270}
# {"revealFKeyModifiers":1048576}
# {"revealFKeyEnabled":false}

#	Global hot-keys -> Application Launcher
#----------------------------------------------
# {"applicationLauncherFKey":63245}
# {"applicationLauncherFKeyModifiers":131072}
# {"applicationLauncherFKeyEnabled":false}

#	Browser Key Action -> Return Key 			(true/false)
#----------------------------------------------------------
$plistbuddy $pf -c "add :kReturnKeyStartsRename bool true"
$plistbuddy $pf -c "set :kReturnKeyStartsRename true"

#	Browser Key Action -> Enter key 			(true/false)
#----------------------------------------------------------
$plistbuddy $pf -c "add :kEnterKeyStartsRename bool true"
$plistbuddy $pf -c "set :kEnterKeyStartsRename true"


#####################################################
#													#
#				⬇︎ Text Editor tab					#
#													#
#####################################################

#	Wrap to Page 									(true/false)
#------------------------------------------------
$plistbuddy $pf -c "add :kWrapToPage bool false"
$plistbuddy $pf -c "set :kWrapToPage false"

#	Show Ruler 										(true/false)
#------------------------------------------------
$plistbuddy $pf -c "add :kShowRuler bool false"
$plistbuddy $pf -c "set :kShowRuler false"

#	Check spelling automatically 					(true/false)
#----------------------------------------------------------
$plistbuddy $pf -c "add :kCheckSpellingWhileTyping bool false"
$plistbuddy $pf -c "set :kCheckSpellingWhileTyping false"

#	Open using encoding:
#			-> Automatic	= 0
#			-> UTF 8 		= 4
#--------------------------------------------------------------
$plistbuddy $pf -c "add :kEncodingPrefForReadingKey integer 0"
$plistbuddy $pf -c "set :kEncodingPrefForReadingKey 0"

#	Save using encoding: 	Automatic = 0
#			 				UTF 8 	  = 4
#--------------------------------------------------------------
$plistbuddy $pf -c "add :kEncodingPrefForWritingKey integer 4"
$plistbuddy $pf -c "set :kEncodingPrefForWritingKey 4"

#	Ignore HTML commands when opening text files 		(true/false)
#-------------------------------------------------------------------
$plistbuddy $pf -c "add :ignoreHTMLInTextEditor bool false"
$plistbuddy $pf -c "set :ignoreHTMLInTextEditor false"

#	Ignore Rich Text commands when opening text files 		(true/false)
#-----------------------------------------------------------------------
$plistbuddy $pf -c "add :ignoreRTFInTextEditor bool false"
$plistbuddy $pf -c "set :ignoreRTFInTextEditor false"

#	New file format: 	Rich text 	= true
#					    Plain text 	= false
#-------------------------------------------------------------
$plistbuddy $pf -c "add :kDefaultFormatIsRichText bool false"
$plistbuddy $pf -c "set :kDefaultFormatIsRichText false"

#	Automatically open in text editor 						 (true/false)
#------------------------------------------------------------------------
$plistbuddy $pf -c "add :kAutomaticallyOpenTextFilesInEditor bool false"
$plistbuddy $pf -c "set :kAutomaticallyOpenTextFilesInEditor false"


#####################################################
#													#
#					⬇︎ Desktop tab					#
#													#
#####################################################

#	Show Path Finder desktop 								(true/false)
#-----------------------------------------------------------------------
#	ATTENTION: this option modifies plists in finder, spaces and dock,
#	and is thus more suitable to simply click and PF will make the changes 

#	Show desktop trash can 			    (true/false)
#---------------------------------------------------
$plistbuddy $pf -c "add :trash_isVisible bool true"
$plistbuddy $pf -c "set :trash_isVisible true"

#	Open folders in: 	New window = 0
#					    New tab    = 1
#--------------------------------------------------------------
$plistbuddy $pf -c "add :kDesktopOpenFolderBehavior integer 1"
$plistbuddy $pf -c "set :kDesktopOpenFolderBehavior 1"


#####################################################
#													#
#				 ⬇︎ Contextual tab 					#
#													#
#####################################################

#	Small contextual menu font size 						   (true/false)
#--------------------------------------------------------------------------
$plistbuddy $pf -c "add :NTUseSmallFontForContextualMenuPrefKey bool true"
$plistbuddy $pf -c "set :NTUseSmallFontForContextualMenuPrefKey true"


#####################################################
#													#
#			 	 ⬇︎ Preview tab						#
#													#
#####################################################

#	Auto-play video and audio files 			(true/false)
#-----------------------------------------------------------
$plistbuddy $pf -c "add :autoPlayMoviesInPreview bool false"
$plistbuddy $pf -c "set :autoPlayMoviesInPreview false"

#	Ignore HTML tags when previewing file		(true/false)
#-----------------------------------------------------------
$plistbuddy $pf -c "add :kIgnoreHTML bool true"
$plistbuddy $pf -c "set :kIgnoreHTML true"

#	Ignore RTF tags when previewing file 		(true/false)
#-----------------------------------------------------------
$plistbuddy $pf -c "add :kIgnoreRTF bool true"
$plistbuddy $pf -c "set :kIgnoreRTF true"

#	Font
#-----------------------------------------------------------------------------
#	ATTENTION: fonts are in Null format and will be left out of this script.

#	Encoding: 	Automatic 		= 0
#			    Unicode UTF 8 	= 4
#----------------------------------------------------
$plistbuddy $pf -c "add :kPreviewEncoding integer 0"
$plistbuddy $pf -c "set :kPreviewEncoding 0"


#####################################################
#													#
#				⬇︎ Terminal tab						#
#													#
#####################################################

#	 Open in Terminal: 	Opens in new tab in a window = 0
#		 				Opens in new window" 		 = 1
#------------------------------------------------------------
$plistbuddy $pf -c "add :NTOpenInTerminalBehavior integer 0"
$plistbuddy $pf -c "set :NTOpenInTerminalBehavior 0"

#	Antialias 								(true/false)
#-------------------------------------------------------
$plistbuddy $pf -c "add :NTTerminalAntialias bool true"
$plistbuddy $pf -c "set :NTTerminalAntialias true"

#	Cursor type: 	Box				= 0
#		 			Underline		= 1
#		 			Vertical link 	= 2
#---------------------------------------------------------
$plistbuddy $pf -c "add :NTTerminalCursorShape integer 2"
$plistbuddy $pf -c "set :NTTerminalCursorShape 2"

#	Option key is meta 							(true/false)
#------------------------------------------------------------
$plistbuddy $pf -c "add :NTTerminalOptionKeyMeta bool false"
$plistbuddy $pf -c "set :NTTerminalOptionKeyMeta false"

#	Delete send control-H 						(true/false)
#----------------------------------------------------------
$plistbuddy $pf -c "add :NTTerminalDeleteCtlrH bool false"
$plistbuddy $pf -c "set :NTTerminalDeleteCtlrH false"

#	Copy on selection 							(true/false)
#------------------------------------------------------------
$plistbuddy $pf -c "add :NTTerminalCopyOnSelect bool false"
$plistbuddy $pf -c "set :NTTerminalCopyOnSelect false"

#	Middle buttons paste 							(true/false)
#---------------------------------------------------------------
$plistbuddy $pf -c "add :NTTerminalMiddleClickPaste bool false"
$plistbuddy $pf -c "set :NTTerminalMiddleClickPaste false"

#	Run command 									(true/false)
#----------------------------------------------------------------
$plistbuddy $pf -c "add :NTTerminalRunCommandOnStart bool false"
$plistbuddy $pf -c "set :NTTerminalRunCommandOnStart false"


#####################################################
#													#
#				⬇︎ File Operation tab				#
#													#
#####################################################

#	Verify copied Files 					(true/false)
#--------------------------------------------------------
$plistbuddy $pf -c "add :NTVerifyCopiedFiles bool false"
$plistbuddy $pf -c "set :NTVerifyCopiedFiles false"

#	Automatically respond on errors: 		     (true/false)
#------------------------------------------------------------
$plistbuddy $pf -c "add :NTFileOpErrorAutoRespond bool true"
$plistbuddy $pf -c "set :NTFileOpErrorAutoRespond true"

# 	Choose type of response: 	Skip = 1
#			 					Stop = 2
#-----------------------------------------------------------------
$plistbuddy $pf -c "add :NTFileOpErrorAutoResponseType integer 2"
$plistbuddy $pf -c "set :NTFileOpErrorAutoResponseType 2"


#####################################################
# 													#
#				⬇︎ File Comparison tab 				#
#													#
#####################################################

#   File Comparison tool path
#-----------------------------------------------------------
$plistbuddy $pf -c "add :kNTDiffToolPath string /usr/bin/opendiff"
$plistbuddy $pf -c "set :kNTDiffToolPath /usr/bin/opendiff"


#############################
#							#														
#		⬇︎ Dropbox tab 		#	
#							#							
#############################

#	CAVEAT:
#	These options are not empirically testet in this script,
#	as my Dropbox configuration is atypical.
#	I extracted the command from a former plist,
#	that was not running same version as my current:
#	< Path Finder beta version 8.0b49 (1857) >
#------------------------------------------------------------------

#	Dropbox folder path
#------------------------------------------------------------------
# $plistbuddy $pf -c "add :NTDropboxPath string <path/to/dropbox>"
# $plistbuddy $pf -c "set :NTDropboxPath <path/to/dropbox>"

#	Show link alert messages on startup if not linked
#-----------------------------------------------------
#	This is checked by default and greyed out, 
#	when Dropbox has not been linked. 
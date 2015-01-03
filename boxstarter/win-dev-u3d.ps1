# Demo BoxStarter configuration for a development machine
# HighSkillz, v1.0.0, 2015-01-02

# Boxstarter options
$Boxstarter.RebootOk=$true
$Boxstarter.NoPassword=$false
$Boxstarter.AutoLogin=$true

# Basic setup
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar
Set-StartScreenOptions  -EnableBootToDesktop -EnableDesktopBackgroundOnStart -EnableShowStartOnActiveScreen -EnableShowAppsViewOnStartScreen -EnableSearchEverywhereInAppsView -EnableListDesktopAppsFirst
Set-TaskbarOptions -Size Small -Lock -Dock Bottom

Enable-RemoteDesktop
Disable-InternetExplorerESC
Disable-UAC
Update-ExecutionPolicy Unrestricted
#Enable-PSRemoting -Force

Enable-WindowsOptionalFeature –Online –FeatureName NetFx3 –All

Enable-MicrosoftUpdate

if (Test-PendingReboot) { Invoke-Reboot }

# ====================================================================================================
# Update Windows and reboot if necessary
Install-WindowsUpdate -getUpdatesFromMS -acceptEula 
if (Test-PendingReboot) { Invoke-Reboot }

# ====================================================================================================
#cinst Microsoft-Hyper-V-All -source windowsFeatures
#cinst IIS-WebServerRole -source windowsfeatures
#cinst IIS-HttpCompressionDynamic -source windowsfeatures
#cinst IIS-ManagementScriptingTools -source windowsfeatures
#cinst IIS-WindowsAuthentication -source windowsfeatures
 
# ====================================================================================================
cinst vcredist2005
cinst vcredist2008
cinst vcredist2010
cinst vcredist2012
cinst vcredist2013
if (Test-PendingReboot) { Invoke-Reboot }

# ====================================================================================================
cinst ChocolateyGUI
cinst notepadplusplus.install
cinst 7zip.install
cinst winrar
cinst beyondcompare
cinst gitextensions
cinst sourcetree
cinst LinkShellExtension

# ====================================================================================================
cinst sysinternals
cinst cpu-z
#cinst speedfan

# ====================================================================================================
# SSH and remote connections
cinst putty.install
cinst mremoteng
#cinst tunnelier
#cinst xming

# ====================================================================================================
# browsers
cinst googlechrome-allusers
#cinst google-chrome-x64
cinst Firefox

# ====================================================================================================
# runtimes
cinst nodejs.install
cinst java.jdk
cinst python3
#cinst AdobeAIR
cinst Silverlight
#cinst mono
cinst dotnet4.5.1
#cinst dotnet4.5.2

# ====================================================================================================
# VM and infra
cinst virtualbox  
cinst virtualbox.extensionpack
cinst vboxheadlesstray
cinst vagrant

# ====================================================================================================
# Unity3D stuff
cinst unity4
cinst upackx

# ====================================================================================================
# Install Visual Studio 2013 Professional 
cinst VisualStudio2013Professional -InstallArguments "/Features:'WebTools Win8SDK Blend'"
if (Test-PendingReboot) { Invoke-Reboot }

# Install Visual Studio 2013 Professional Update 4
cinst vs2013.4
if (Test-PendingReboot) { Invoke-Reboot }

cinst DotNet3.5 
# Not automatically installed with VS 2013. Includes .NET 2.0. Uses Windows Features to install.
if (Test-PendingReboot) { Invoke-Reboot }

# Install Visual Studio 2013 addons
cinst visualstudio2013-webessentials.vsix
cinst vs2013.vscommands
#cinst nugetpackagemanagerforvisualstudio2013
#cinst visualfsharptools

# ====================================================================================================
#cinst xamarin-visualstudio
#cinst xamarin-studio
#cinst xamarin
#cinst monodevelop

#cinst genymotion   
#cinst android-sdk
#cinst androidstudio
#cinst apktool

#cinst eclipse

cinst sublimetext3
cinst jivkok.sublimetext3.packages

cinst NugetPackageExplorer
cinst fiddler4
cinst nant
cinst dotpeek
#cinst devbox-gitflow
#cinst Gow
cinst bulkrenameutility

cinst greenshot

cinst PowerGUI
cinst pscx
cinst pstools
cinst ouiguichocolatey
cinst lessmsi

# ====================================================================================================
#cinst cyberduck
cinst FileZilla
cinst cloudberryexplorer.azurestorage
cinst cloudberryexplorer.amazons3
cinst cloudberryexplorer.googlestorage
cinst azurestorageexplorer

# ====================================================================================================
#cinst mysql
#cinst mysql.workbench
#cinst postgresql
#cinst postgresql93
#cinst pgadmin3

#cinst sqlite.shell
#cinst sqliteadmin
#cinst sqlite.analyzer

#cinst databasenet

cinst curl
cinst wget

cinst winmerge
cinst windirstat

# ====================================================================================================
#cinst hipchat
cinst skype
#cinst pidgin

#cinst OpenSSL.Light
#cinst openvpn

# ====================================================================================================
# Audio and video
cinst audacity
cinst mediamonkey
cinst vlc

# ====================================================================================================
# 3D
cinst blender

# ====================================================================================================
# 2D
cinst paint.net
cinst gimp
cinst inkscape
cinst irfanview

# ====================================================================================================
cinst dropbox
cinst onedrive
cinst btsync

# ====================================================================================================
cinst keepass.install
cinst passwordsafe

# ====================================================================================================
cinst libreoffice
#cinst adobereader

cinst f.lux

cinst wincdemu
cinst imgburn

# ====================================================================================================
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe"

#add-pathvariable -Value "c:\Program Files\Oracle\VirtualBox", "C:\Python27", "c:\Program Files\nodejs", "C:\Program Files\Java\jdk1.8.0_25", "c:\bin\apache-maven-3.2.1", "c:\Program Files (x86)\JetBrains\IntelliJ IDEA Community Edition 13.1.5\bin" -Name Path -target machine 
# 
#set-pathvariable -Value "C:\Program Files\Java\jdk1.8.0_25" -Name JAVA_HOME -target machine 
#set-pathvariable -Value "C:\Program Files\Java\jdk1.8.0_25" -Name JDK_HOME -target machine

# ====================================================================================================
Update-ExecutionPolicy RemoteSigned 
Enable-UAC

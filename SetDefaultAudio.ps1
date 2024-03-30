#
#Setup Steps
# Source 'https://github.com/frgnca/AudioDeviceCmdlets' Run the following command to install
#Install-Module -Name AudioDeviceCmdlets
# Install all prompts.

# Then run the following command to view the Names & Ids of the audio sources
#get-audiodevice -list
# Replace the Number below with your desired default audio device. In my case it was #5.

# Run
$V = Get-audiodevice -playback
if ($V.Name.StartsWith("SteelSeries Sonar")) 
    {set-audiodevice -index 5} else 
    {set-audiodevice -index 5} 

#timeout /t -1 #Remove # for Debugging

#Troubleshooting
# If this does not work
# 1. Confirm you have powershell installed
# 2. Ensure Powershell is enabled: Turn Windows Features On / Off
# 3. Run the following command in Powershell: Get-ExecutionPolicy if it says Restricted it means the script wont run. you need to run the following set-executionpolicy RemoteSigned
## For security reasons use RemoteSigned instead of Unrestricted as it does not require locally written scripts to be signed. 

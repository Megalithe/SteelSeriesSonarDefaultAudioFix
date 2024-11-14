#
#Setup Steps
# Source 'https://github.com/frgnca/AudioDeviceCmdlets' Run the following command to install
#Install-Module -Name AudioDeviceCmdlets
# Install all prompts.

# Then run the following command to view the Names & Ids of the audio sources
#get-audiodevice -list

# Use the output above to determine your preferred device and set it below.
$default = "Speakers (4- SteelSeries Arena 7)"
# Note if you have variable preferences add an if statement here to prioritize which device over the other

# Run the command to get audio devices and filter for the specific device, then select only the Index property
$index = (Get-AudioDevice -List | Where-Object { $_.Name -eq $default }).Index

# Output the Index and set the default audio for the system
set-audiodevice -index $index

#timeout /t -1 #Remove # for Debugging

#Troubleshooting
# If this does not work
# 1. Confirm you have powershell installed
# 2. Ensure Powershell is enabled: Turn Windows Features On / Off
# 3. Run the following command in Powershell: Get-ExecutionPolicy if it says Restricted it means the script wont run. you need to run the following set-executionpolicy RemoteSigned
## For security reasons use RemoteSigned instead of Unrestricted as it does not require locally written scripts to be signed. 

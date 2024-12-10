#
# Setup Steps
# Source 'https://github.com/frgnca/AudioDeviceCmdlets'
# Run the following command to install: Install-Module -Name AudioDeviceCmdlets
# Run the following command to view the Names & Ids of the audio sources: Get-AudioDevice -List

# In order to use the physcial volume slider on your keyboard or the global windows slider use your speakers or headset as your default audio device. 
#In my case the Device is called Speakerse (3- SteelSeries Arena 7) however the 3- can change. 
#So update the following section to parse accordingly. Leave the "\(.+-" below to ignore those characters.

# Define the partial name pattern for the default device
$defaultPattern = "Speakers \(.+- SteelSeries Arena 7"

# Run the command to get audio devices and filter using the regex pattern
$device = Get-AudioDevice -List | Where-Object { $_.Name -match $defaultPattern }

if ($device) {
    # Output the Index and set the default audio for the system
    Set-AudioDevice -Index $device.Index
    Write-Host "Audio device set to $($device.Name) (Index: $($device.Index))"
} else {
    Write-Host "Error: No audio device matching pattern '$defaultPattern' was found."
}

#Troubleshooting
# If this does not work
# 1. Confirm you have powershell installed
# 2. Ensure Powershell is enabled: Turn Windows Features On / Off
# 3. Run the following command in Powershell: Get-ExecutionPolicy if it says Restricted it means the script wont run. you need to run the following set-executionpolicy RemoteSigned
# 4. Due to system performance and applications running at startup you may need to adjust the delays cited in the readme.
# 5. Check the defaultPattern and ensure its parsing for the correct syntax.
## For security reasons use RemoteSigned instead of Unrestricted as it does not require locally written scripts to be signed. 

# Uncomment the following line for debugging
# timeout /t -1

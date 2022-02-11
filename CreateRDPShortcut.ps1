# Set the machine name here
$rdpAddress = "";
# Set the output file name here
$output = "C:\Users\[USER]\Desktop\[MACHINE].rdp";
cls;
Add-Type -AssemblyName System.Windows.Forms;
$allScreens = ([System.Windows.Forms.Screen]::AllScreens|sort -Property {$_.Displayname} );
$RDPOutput = "# Date Generated {4}
screen mode id:i:2
use multimon:i:1
# mstsc /l
selectedmonitors:s:{0},{1}
span monitors:i:1
desktopwidth:i:{2}
desktopheight:i:{3}
session bpp:i:32
winposstr:s:0,1,-512,58,1668,1024
compression:i:1
keyboardhook:i:2
audiocapturemode:i:0
videoplaybackmode:i:1
connection type:i:2
networkautodetect:i:0
bandwidthautodetect:i:1
displayconnectionbar:i:1
enableworkspacereconnect:i:0
disable wallpaper:i:1
allow font smoothing:i:0
allow desktop composition:i:0
disable full window drag:i:1
disable menu anims:i:1
disable themes:i:0
disable cursor setting:i:0
bitmapcachepersistenable:i:1
full address:s:192.168.2.24
audiomode:i:2
redirectprinters:i:0
redirectcomports:i:0
redirectsmartcards:i:1
redirectclipboard:i:1
redirectposdevices:i:0
autoreconnection enabled:i:1
authentication level:i:2
prompt for credentials:i:1
administrative session:1:1
negotiate security layer:i:1
remoteapplicationmode:i:0
alternate shell:s:
shell working directory:s:
gatewayhostname:s:
gatewayusagemethod:i:4
gatewaycredentialssource:i:4
gatewayprofileusagemethod:i:0
promptcredentialonce:i:0
gatewaybrokeringtype:i:0
use redirection server name:i:0
rdgiskdcproxy:i:0
kdcproxyname:s:
drivestoredirect:s:
camerastoredirect:s:*" -f (($allScreens[1].DeviceName -replace "[^0-9]", "")-1), (($allScreens[2].DeviceName -replace "[^0-9]", "")-1), ($allScreens[1].Bounds.Width), ($allScreens[1].Bounds.Height), ((Get-Date).ToString("yyyy-MM-dd"));

Set-Content -Path $output -Value $RDPOutput;
Start-Sleep -seconds 5;

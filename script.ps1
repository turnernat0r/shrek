$url = 'https://c4.wallpaperflare.com/wallpaper/966/989/139/shrek-movies-animated-movies-dreamworks-hd-wallpaper-preview.jpg'
Invoke-WebRequest $url -OutFile c:\temp\file.jpg

# Define the path to the wallpaper file
$wallpaperPath = "C:\temp\file.jpg"

# Load the required DLLs
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Wallpaper {
  [DllImport("user32.dll", CharSet = CharSet.Auto)]
  public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@
# Constants for wallpaper change
$SPI_SETDESKWALLPAPER = 0x0014
$SPIF_UPDATEINIFILE = 0x01
$SPIF_SENDCHANGE = 0x02

# Set the wallpaper
[Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $wallpaperPath, $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE)

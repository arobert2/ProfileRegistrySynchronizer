Param (
    [Parameter(Mandatory=$True)]
    [string]$Regpath
)

$profilepath = "C:\users\"

$Profiles = get-childitem $profilepath
$ntuserprofs = @();

#look through all profiles folders in $profilepath
foreach($child in $profiles)
{
    #look through all children of $profilepath children
    $items = get-childitem ($profilepath + $child) -Force
    foreach($item in $items)
    {
        #If the folder contains ntuser.dat it adds it to ntuserprofs array.
        if($item.ToLower() -eq "ntuser.dat")
        {
           $ntuserprofs += ,$child 
        }
    }
}

#Load each ntuser.dat and import data.
foreach($ntuser in $intuserprofs)
{
    #Load hive
    $args = "LOAD HKEY_LOCAL_MACHINE\LOADEDHIVE " + $profilepath + $nutuser.Name + "\ntuser.dat"
    Start-Process reg.exe $args -Wait

    #edit hive
    $args = "IMPORT " + $Regpath
    Start-Process reg.exe $args -Wait

    #unload hive
    $args = "UNLOAD HKEY_LOCAL_MACHINE\LOADEDHIVE"
    Start-Process reg.exe $args
}
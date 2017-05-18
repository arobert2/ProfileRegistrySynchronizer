NOTE: This is currently untested but should work.

This script will load each NTUSER.DAT file within C:\users, import the reg file you provide it, then unload the ntuser.dat file.

registry files must match the name of the hive expected by the script. To use do the following.

1. Export from registry or create a new .reg file
2. Replace the hive name of the registry keys exported (HKEY_CURRENTUSER\RegistryKey will become HKEY_LOCAL_MACHINE\LOADEDHIVE\RegistryKey)
3. Call the script with the modified .reg file (.\RegistrySynchronizer.ps1 ModifiedRegFile.reg)
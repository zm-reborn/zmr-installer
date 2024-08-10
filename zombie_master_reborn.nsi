; Modify this path. NO ENDING SLASH.
!define PATH_TO_FILES "C:\Program Files (x86)\Steam\steamapps\common\Source SDK Base 2013 Multiplayer\zombie_master_reborn"

; Executable name.
!define ZIP2EXE_OUTFILE "zombie_master_reborn.exe"


!define MUI_ICON "${PATH_TO_FILES}\resource\game.ico"
!define MOD_PATH "zombie_master_reborn"

!define ZIP2EXE_COMPRESSOR_ZLIB
!define ZIP2EXE_NAME "Zombie Master: Reborn"

!define COMPANYNAME "ZM Reborn Team"

; ------------------------------------
!define ZIP2EXE_INSTALLDIR "PATH_TO_SOURCEMOD_FOLDER"

Unicode True

!include "${NSISDIR}\Contrib\zip2exe\Base.nsh"
!include "${NSISDIR}\Contrib\zip2exe\Modern.nsh"


!insertmacro SECTION_BEGIN
File /r /x .git /x .gitattributes /x .gitignore /x *.so /x *.dbg /x README.md /x *.pdb /x zmr_dev_setup.ps1 /x *.cache "${PATH_TO_FILES}\*.*"
!insertmacro SECTION_END

Function .onInit
	ReadRegStr $R0 HKCU "Software\Valve\Steam" SourceModInstallPath
	StrCpy $INSTDIR "$R0\${MOD_PATH}"
FunctionEnd

Page custom onFinished
Function onFinished
	MessageBox MB_OK|MB_ICONINFORMATION "Steam must be restarted for ${ZIP2EXE_NAME} to show on the games list.$\n$\nOnce restarted, running the game will install Source SDK Base 2013 Multiplayer."
FunctionEnd

# Auto-generated by EclipseNSIS Script Wizard
# 09.04.2013 14:42:57

Name SXTrader

# General Symbol Definitions
!define REGKEY "SOFTWARE\$(^Name)"
!define VERSION 2.3.0
!define COMPANY SXTrader
!define URL http://www.sxtrader.net

# MultiUser Symbol Definitions
!define MULTIUSER_EXECUTIONLEVEL Highest
!define MULTIUSER_MUI
!define MULTIUSER_INSTALLMODE_DEFAULT_REGISTRY_KEY "${REGKEY}"
!define MULTIUSER_INSTALLMODE_DEFAULT_REGISTRY_VALUENAME MultiUserInstallMode
!define MULTIUSER_INSTALLMODE_COMMANDLINE
!define MULTIUSER_INSTALLMODE_INSTDIR SXTrader
!define MULTIUSER_INSTALLMODE_INSTDIR_REGISTRY_KEY "${REGKEY}"
!define MULTIUSER_INSTALLMODE_INSTDIR_REGISTRY_VALUE "Path"

# MUI Symbol Definitions
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install-colorful.ico"
!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_STARTMENUPAGE_REGISTRY_ROOT HKLM
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_REGISTRY_KEY ${REGKEY}
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME StartMenuGroup
!define MUI_STARTMENUPAGE_DEFAULTFOLDER SXTrader
!define MUI_FINISHPAGE_RUN $INSTDIR\BFTSGUI.exe
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall-colorful.ico"
!define MUI_UNFINISHPAGE_NOAUTOCLOSE

# Included files
!include MultiUser.nsh
!include Sections.nsh
!include MUI2.nsh

# Variables
Var StartMenuGroup

# Installer pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MULTIUSER_PAGE_INSTALLMODE
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_STARTMENU Application $StartMenuGroup
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

# Installer languages
!insertmacro MUI_LANGUAGE English
!insertmacro MUI_LANGUAGE German

# Installer attributes
OutFile SXTraderSetup.exe
InstallDir SXTrader
CRCCheck on
XPStyle on
ShowInstDetails show
VIProductVersion 2.3.0.0
VIAddVersionKey /LANG=${LANG_ENGLISH} ProductName SXTrader
VIAddVersionKey /LANG=${LANG_ENGLISH} ProductVersion "${VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} CompanyName "${COMPANY}"
VIAddVersionKey /LANG=${LANG_ENGLISH} CompanyWebsite "${URL}"
VIAddVersionKey /LANG=${LANG_ENGLISH} FileVersion "${VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} FileDescription ""
VIAddVersionKey /LANG=${LANG_ENGLISH} LegalCopyright ""
InstallDirRegKey HKLM "${REGKEY}" Path
ShowUninstDetails show

# Installer sections
Section -Main SEC0000
    SetOutPath $INSTDIR
    SetOverwrite on
    File ..\..\..\SXTrader\BetdaqIF.dll
    File ..\..\..\SXTrader\BetdaqIF.XmlSerializers.dll
    File ..\..\..\SXTrader\BetFairIF.dll
    File ..\..\..\SXTrader\BetFairIF.XmlSerializers.dll
    File ..\..\..\SXTrader\BFTSGUI.exe
    File ..\..\..\SXTrader\BFUEStrategy.dll
    File ..\..\..\SXTrader\CommonHistoryGraph.dll
    File ..\..\..\SXTrader\ImapX.dll
    File ..\..\..\SXTrader\LayerOfProfit.dll
    File ..\..\..\SXTrader\LiveScoreParser.dll
    File ..\..\..\SXTrader\LSParserInterfaces.dll
    File ..\..\..\SXTrader\PlugInIF.dll
    File ..\..\..\SXTrader\SXAL.dll
    File ..\..\..\SXTrader\SXALInterfaces.dll
    File ..\..\..\SXTrader\SXFastBet.dll
    File ..\..\..\SXTrader\SXHelper.dll
    File ..\..\..\SXTrader\SXMUK.dll
    File ..\..\..\SXTrader\SXStatisticBase.dll
    File ..\..\..\SXTrader\TheLowLay.dll
    File ..\..\..\SXTrader\TradeInterfaces.dll
    File ..\..\..\SXTrader\TradeTheReaction.dll
    SetOutPath $INSTDIR\de
    File /r ..\..\..\SXTrader\de\*    
    SetOutPath $DESKTOP
    CreateShortcut $DESKTOP\SXTrader.lnk $INSTDIR\BFTSGUI.exe
    WriteRegStr HKLM "${REGKEY}\Components" Main 1
SectionEnd

Section -post SEC0001
    WriteRegStr HKLM "${REGKEY}" Path $INSTDIR
    SetOutPath $INSTDIR
    WriteUninstaller $INSTDIR\uninstall.exe
    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    SetOutPath $SMPROGRAMS\$StartMenuGroup
    CreateShortcut "$SMPROGRAMS\$StartMenuGroup\$(^UninstallLink).lnk" $INSTDIR\uninstall.exe
    CreateShortcut "$SMPROGRAMS\$StartMenuGroup\SXTrader.lnk" $INSTDIR\BFTSGUI.exe
    !insertmacro MUI_STARTMENU_WRITE_END
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" DisplayName "$(^Name)"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" DisplayVersion "${VERSION}"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" Publisher "${COMPANY}"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" URLInfoAbout "${URL}"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" DisplayIcon $INSTDIR\uninstall.exe
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" UninstallString $INSTDIR\uninstall.exe
    WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" NoModify 1
    WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" NoRepair 1
SectionEnd

# Macro for selecting uninstaller sections
!macro SELECT_UNSECTION SECTION_NAME UNSECTION_ID
    Push $R0
    ReadRegStr $R0 HKLM "${REGKEY}\Components" "${SECTION_NAME}"
    StrCmp $R0 1 0 next${UNSECTION_ID}
    !insertmacro SelectSection "${UNSECTION_ID}"
    GoTo done${UNSECTION_ID}
next${UNSECTION_ID}:
    !insertmacro UnselectSection "${UNSECTION_ID}"
done${UNSECTION_ID}:
    Pop $R0
!macroend

# Uninstaller sections
Section /o -un.Main UNSEC0000
    Delete /REBOOTOK $DESKTOP\SXTrader.lnk
    RmDir /r /REBOOTOK $INSTDIR\Plugins
    RmDir /r /REBOOTOK $INSTDIR\de
    Delete /REBOOTOK $INSTDIR\TradeInterfaces.dll
    Delete /REBOOTOK $INSTDIR\SXStatisticBase.dll
    Delete /REBOOTOK $INSTDIR\SXMUK.dll
    Delete /REBOOTOK $INSTDIR\SXHelper.dll
    Delete /REBOOTOK $INSTDIR\SXFastBet.dll
    Delete /REBOOTOK $INSTDIR\SXALInterfaces.dll
    Delete /REBOOTOK $INSTDIR\SXAL.dll
    Delete /REBOOTOK $INSTDIR\PlugInIF.dll
    Delete /REBOOTOK $INSTDIR\LSParserInterfaces.dll
    Delete /REBOOTOK $INSTDIR\LiveScoreParser.dll
    Delete /REBOOTOK $INSTDIR\ImapX.DLL
    Delete /REBOOTOK $INSTDIR\BFTSGUI.exe
    Delete /REBOOTOK $INSTDIR\BetFairIF.dll
    Delete /REBOOTOK $INSTDIR\BetdaqIF.dll
    DeleteRegValue HKLM "${REGKEY}\Components" Main
SectionEnd

Section -un.post UNSEC0001
    DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)"
    Delete /REBOOTOK "$SMPROGRAMS\$StartMenuGroup\$(^UninstallLink).lnk"
    Delete /REBOOTOK $INSTDIR\uninstall.exe
    DeleteRegValue HKLM "${REGKEY}" StartMenuGroup
    DeleteRegValue HKLM "${REGKEY}" Path
    DeleteRegKey /IfEmpty HKLM "${REGKEY}\Components"
    DeleteRegKey /IfEmpty HKLM "${REGKEY}"
    RmDir /REBOOTOK $SMPROGRAMS\$StartMenuGroup
    RmDir /REBOOTOK $INSTDIR
SectionEnd

# Installer functions
Function .onInit
    InitPluginsDir
    !insertmacro MULTIUSER_INIT
FunctionEnd

# Uninstaller functions
Function un.onInit
    !insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuGroup
    !insertmacro MULTIUSER_UNINIT
    !insertmacro SELECT_UNSECTION Main ${UNSEC0000}
FunctionEnd

# Installer Language Strings
# TODO Update the Language Strings with the appropriate translations.

LangString ^UninstallLink ${LANG_ENGLISH} "Uninstall $(^Name)"
LangString ^UninstallLink ${LANG_GERMAN} "Uninstall $(^Name)"

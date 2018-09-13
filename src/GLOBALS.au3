#cs ----------------------------------------------------------------------------

Defines application constants and variables declared in global scope.

@project        : ags-example-01-minimal
@version        : v1.0.0
@author         : v20100v <vb20100bv@gmail.com
@AGS framework  : v1.0.0
@AutoIt version : v3.3.14.5

All application constants and global variables are defined in this place in
order to centralize the declaration of all global variables. With the exception
of all the global variables of the graphic elements, which they are defined in
each specific view file. Don’t forget that constants can no longer change value
over time, unlike global variables. If a global variable changes its value, it
can not be persisted , unless to do it in the configuration file
'./config/parameters.ini'.

By convention, all global variables must be written in capital letter and
separated by underscore - for example : Global Const $APP_EMAIL_CONTACT

#ce ----------------------------------------------------------------------------


#include-once


;-------------------------------------------------------------------------------
; Alias helper
;-------------------------------------------------------------------------------
Global Const $APP_FOLDER_ROOT = @ScriptDir & "/../"
Global Const $APP_FOLDER_ASSETS = @ScriptDir & "/assets"


;-------------------------------------------------------------------------------
; Parameters
;-------------------------------------------------------------------------------
Global Const $APP_PARAMETERS_INI = @ScriptDir & "/config/parameters.ini"
Local $fileExists = FileExists($APP_PARAMETERS_INI)
If Not $fileExists Then
	MsgBox(16, _
		"Error on load parameters.ini", _
		"Unable to find the file './config/parameters.ini'! " & @CRLF & _
		"This application can not work, you must create this file. You can use " & _
		"the file './config/parameters.ini.dist' as a template to create it.")
EndIf


;-------------------------------------------------------------------------------
; Application main constants
;-------------------------------------------------------------------------------
Global Const $APP_NAME = "ags-example-01-minimal"
Global Const $APP_VERSION = "1.0.0"
Global Const $APP_WEBSITE = "https://github.com/autoit-gui-skeleton/ags-example-01-minimal"
Global Const $APP_EMAIL_CONTACT = "myApplication@website.org"
Global Const $APP_LIFE_PERIOD = "2018-" & @YEAR
Global Const $APP_COPYRIGHT = "© " & $APP_LIFE_PERIOD & ", A.C.M.E."


;-------------------------------------------------------------------------------
; Application GUI constants
;-------------------------------------------------------------------------------
Global Const $APP_WIDTH = 800
Global Const $APP_HEIGHT = 600
Global Const $APP_GUI_BACKGROUND_COLOR = 0xFFFFFF
Global Const $APP_GUI_TITLE_COLOR = 0x85C4ED
Global Const $APP_GUI_LINK_COLOR = 0x5487FB
Global Const $APP_GUI_ICON = "./assets/images/myApplication.ico"


;-------------------------------------------------------------------------------
; AGS-component-check-for-updates configuration
;
; Configure the JSON repository used to check for updates. This json file must
; persist in a remote server available via internet, and without restriction.
; If you use Github as a control version, you can use it to host this file.
;-------------------------------------------------------------------------------
Global Const $APP_REMOTE_RELEASES_JSON = "https://raw.githubusercontent.com/MyProject/master/RELEASES.json"

;-------------------------------------------------------------------------------
; Application custom global variables
;-------------------------------------------------------------------------------
Global $OPEN_FILE = False
Global $OPEN_FILE_PATH = -1
Global $OPEN_FILE_NAME = -1

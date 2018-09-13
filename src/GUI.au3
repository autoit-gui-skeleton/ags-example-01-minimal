#cs ----------------------------------------------------------------------------

Main manager of the GUI

@project        : ags-example-01-minimal
@version        : v1.0.0
@author         : v20100v <vb20100bv@gmail.com
@AGS framework  : v1.0.0
@AutoIt version : v3.3.14.5

This program contains the app_start() method which is only called with the main
entry program. This method is designed to create the graphical user interface
(GUI) and manage all user interactions and events.

#ce ----------------------------------------------------------------------------


#include-once


; Includes application views
#include './views/View_Footer.au3'
#include './views/View_Welcome.au3'
#include './views/View_About.au3'


;===============================================================================
; Start application.
;
; This method is designed to create the graphical user interface (GUI) and
; manage all user interactions and events.
;
; @param void
; @return void
;===============================================================================
Func app_start()
	Global $main_GUI = GUICreate($APP_NAME, $APP_WIDTH, $APP_HEIGHT, -1, -1, BitXOR($GUI_SS_DEFAULT_GUI, $WS_MINIMIZEBOX))

	_GUI_Init_Menu()

	; By default all elements of this view are visible
	_GUI_Init_Footer()

	; By default all elements of below views are hidden
	_GUI_Init_View_Welcome()
	_GUI_Init_View_About()

	; Set configuration application : icon, background color
	_GUI_Configuration()

	; Show Welcome view on startup
	_GUI_ShowHide_View_Welcome($GUI_SHOW)
	GUISetState(@SW_SHOW)

	; Handle all user interactions and events
	_GUI_HandleEvents()

	GUIDelete()
	Exit
EndFunc


;===============================================================================
; Handle all events application
;
; @param void
; @return void
;===============================================================================
Func _GUI_HandleEvents()
	Local $msg
	While 1
		; GUIGetMsg return the control ID of the control that sending the message
		$msg = GUIGetMsg()
		Switch $msg
			; Trigger on close dialog box
			Case $GUI_EVENT_CLOSE
				ExitLoop

				; Trigger on click on item menu 'File > Exit'
			Case $menuitem_Exit
				ExitLoop
		EndSwitch

		_GUI_HandleEvents_View_Welcome($msg)
		_GUI_HandleEvents_View_About($msg)

		_GUI_HandleEvents_Menu_File($msg)
		_GUI_HandleEvents_Menu_About($msg)
	WEnd
EndFunc


;===============================================================================
; Use it to configure the main GUI (set icon, background color...)
;
; @param void
; @return void
;===============================================================================
Func _GUI_Configuration()
	GUISetIcon($APP_GUI_ICON) ; set icon
	GUISetBkColor($APP_GUI_BACKGROUND_COLOR) ; set background color
EndFunc


;===============================================================================
; Hide elements for all views handle in methods _GUI_ShowHide_View_xxx
;
; @param void
; @return void
;===============================================================================
Func _GUI_Hide_all_view()
	_GUI_ShowHide_View_Welcome($GUI_HIDE)
	_GUI_ShowHide_View_About($GUI_HIDE)
EndFunc


;===============================================================================
; Create a menu control in main GUI
;
; @param void
; @return void
;===============================================================================
Func _GUI_Init_Menu()
	; Create 'File' menu
	Global $menu_File = GUICtrlCreateMenu("File")
	Global $menuitem_Welcome = GUICtrlCreateMenuItem("Welcome", $menu_File)
	Global $menuitem_Separator1 = GUICtrlCreateMenuItem("", $menu_File)
	Global $menuitem_Open = GUICtrlCreateMenuItem("Open file", $menu_File)
	Global $menuitem_New = GUICtrlCreateMenuItem("New file", $menu_File)
	Global $menuitem_Close = GUICtrlCreateMenuItem("Close file", $menu_File)
	Global $menuitem_Separator2 = GUICtrlCreateMenuItem("", $menu_File)
	Global $menuitem_Exit = GUICtrlCreateMenuItem("Exit", $menu_File)
	; Into this 'File' menu, we disable this items
	GUICtrlSetState($menuitem_New, $GUI_DISABLE)
	GUICtrlSetState($menuitem_Close, $GUI_DISABLE)

	; Création 'About' menu
	Global $menu_About = GUICtrlCreateMenu("?")
	Global $menuitem_Credits = GUICtrlCreateMenuItem("About " & $APP_NAME, $menu_About)
	Global $menuitem_Separator3 = GUICtrlCreateMenuItem("", $menu_About)
	Global $menuitem_Feedback_bug = GUICtrlCreateMenuItem("Problem to report ?", $menu_About)
	Global $menuitem_Feedback_opinion = GUICtrlCreateMenuItem("Notice to share ?", $menu_About)
EndFunc


;===============================================================================
; Handler for enable or disable menu. Indeed in case of long treatment, it is
; useful to disable the menu and avoid to launch concurents process.
;
; @param {int} $action, use GUIConstantsEx $GUI_DISABLE or $GUI_ENABLE
; @return void
;===============================================================================
Func _GUI_Handler_Menu($action)
	Switch $action
		Case $GUI_DISABLE
			; Define here all menu items to disable
			GUICtrlSetState($menu_File, $GUI_DISABLE)
			GUICtrlSetState($menu_About, $GUI_DISABLE)

		Case $GUI_ENABLE
			; Define here all menu items to enable
			GUICtrlSetState($menu_File, $GUI_ENABLE)
			GUICtrlSetState($menu_About, $GUI_ENABLE)

	EndSwitch
EndFunc


;===============================================================================
; Handler for events in 'File' menu (click on item menu)
;
; @param $msg, control ID of the control that sending the message
; @return @void
;===============================================================================
Func _GUI_HandleEvents_Menu_File($msg)
	Switch $msg
		; Click on item 'File > Welcome'
		Case $menuitem_Welcome
			ConsoleWrite('Click on "File > Welcome"' & @CRLF)
			_GUI_ShowHide_View_Welcome($GUI_SHOW)

		Case $menuitem_Open
			ConsoleWrite('Click on "File > Open"' & @CRLF)
			_GUI_OpenFile()

		Case $menuitem_Close
			ConsoleWrite('Click on "File > Close"' & @CRLF)
			_GUI_CloseFile()

	EndSwitch
EndFunc


;===============================================================================
; Handler for events in 'About' menu (click on item menu)
;
; @param $msg, control ID of the control that sending the message
; @return @void
;===============================================================================
Func _GUI_HandleEvents_Menu_About($msg)
	Switch $msg

		Case $menuitem_Feedback_bug
			ConsoleWrite('Click on "? > Problem to report ?"' & @CRLF)
			ShellExecute("mailto:" & $APP_EMAIL_CONTACT & "?subject=[" & $APP_NAME & " - v" & $APP_VERSION & "] Report a problem&cc=20100@acme.org")

		Case $menuitem_Feedback_opinion
			ConsoleWrite('Click on "? > Notice to share ?"' & @CRLF)
			ShellExecute("mailto:" & $APP_EMAIL_CONTACT & "?subject=[" & $APP_NAME & " - v" & $APP_VERSION & "] Your notice&cc=20100@acme.org")

		Case $menuitem_Credits
			ConsoleWrite('Click on "? > About myApplication"' & @CRLF)
			_GUI_ShowHide_View_About($GUI_SHOW)

	EndSwitch
EndFunc


;===============================================================================
; Process to execute when a user click on "File > Open".
;
; @param @void
; @return @void
;===============================================================================
Func _GUI_OpenFile()
	Local $openFile = SERVICES_Dialogbox_open_file()

	If ($openFile[0] <> -1) Then
		; Persist status open file in global variables
		$OPEN_FILE = True
		$OPEN_FILE_PATH = $openFile[0]
		$OPEN_FILE_NAME = $openFile[1]

		; Persit the path of open file in parameters.ini
		IniWrite($APP_PARAMETERS_INI, "APPLICATION", "LAST_OPENED_FILE_PATH", $OPEN_FILE_PATH)
		IniWrite($APP_PARAMETERS_INI, "APPLICATION", "LAST_OPENED_FILE_NAME", $OPEN_FILE_NAME)

		; Change to waiting cursor mouse
		GUISetCursor(15, $GUI_CURSOR_OVERRIDE)

		; Update application title and label in 'Welcome' view
		WinSetTitle($APP_NAME, "", $APP_NAME & " - " & $OPEN_FILE_NAME)
		GUICtrlSetData($label_openedFile, "Opened file: " & $OPEN_FILE_NAME)

		; Change to default cursor mouse
		GUISetCursor(2, $GUI_CURSOR_NOOVERRIDE)

		; Enable item action "File > Close" in menu
		GUICtrlSetState($menuitem_Close, $GUI_ENABLE)
	EndIf
EndFunc


;===============================================================================
; Process when user's choice to close the last opened file
;
; @param @void
; @return @void
;===============================================================================
Func _GUI_CloseFile()
	; Update application title
	WinSetTitle($APP_NAME & " - " & $OPEN_FILE_NAME, "", $APP_NAME)
	GUICtrlSetData($label_openedFile, " ")

	; Persist status open file
	$OPEN_FILE = False
	$OPEN_FILE_PATH = -1
	$OPEN_FILE_NAME = -1

	; Disable item action "File > Close" in menu
	GUICtrlSetState($menuitem_Close, $GUI_DISABLE)
EndFunc

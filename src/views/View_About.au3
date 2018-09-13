#cs ----------------------------------------------------------------------------

Handler of the 'About' view

@project        : ags-example-01-minimal
@version        : v1.0.0
@author         : v20100v <vb20100bv@gmail.com
@AGS framework  : v1.0.0
@AutoIt version : v3.3.14.5

#ce ----------------------------------------------------------------------------


#include-once


;==============================================================================================================
; Create element for the 'About' view
;
; @param void
; @return void
;==============================================================================================================
Func _GUI_Init_View_About()
	; GUI elements have to register in global scope
	GUISetFont(20, 800, 0, "Arial Narrow")
	Global $label_title_View_About = GUICtrlCreateLabel("About", 20, 30, 400)
	GUICtrlSetColor($label_title_View_About, $APP_GUI_TITLE_COLOR)
	GUICtrlSetBkColor($label_title_View_About, $GUI_BKCOLOR_TRANSPARENT)

	; Add image
	Global $image_about = GUICtrlCreatePic($APP_FOLDER_ASSETS & "/images/r2d2-blue.jpg", $APP_WIDTH - 400 - 20, 20, 400, 400)

	Local $height = 80
	Local $iterate = 22
	GUISetFont(10, 800, 0, "Segoe UI")
	Global $label_about = GUICtrlCreateLabel($APP_NAME & " - " & $APP_VERSION, 20, $height)

	GUISetFont(10, 400, 0, "Segoe UI")
	Global $label_website = GUICtrlCreateLabel($APP_WEBSITE, 20, $height + $iterate)
	Global $label_email = GUICtrlCreateLabel($APP_EMAIL_CONTACT, 20, $height + 2 * $iterate)
	Global $label_copyright = GUICtrlCreateLabel($APP_COPYRIGHT, 20, $height + 4 * $iterate)

	GUICtrlSetColor($label_website, $APP_GUI_LINK_COLOR)
	GUICtrlSetColor($label_email, $APP_GUI_LINK_COLOR)
	GUICtrlSetCursor($label_website, 0)
	GUICtrlSetCursor($label_email, 0)

	; Hide all elements by default
	_GUI_ShowHide_View_About($GUI_HIDE)
EndFunc


;==============================================================================================================
; Handler for display element on 'About' view
;
; @param {int} $action, use GUIConstantsEx $GUI_SHOW or $GUI_HIDE
; @return void
;==============================================================================================================
Func _GUI_ShowHide_View_About($action)
	Switch $action
		Case $GUI_SHOW
			_GUI_Hide_all_view()
			; Define here all elements to show when user come into this view
			GUICtrlSetState($label_title_View_About, $GUI_SHOW)
			GUICtrlSetState($label_about, $GUI_SHOW)
			GUICtrlSetState($label_website, $GUI_SHOW)
			GUICtrlSetState($label_email, $GUI_SHOW)
			GUICtrlSetState($label_copyright, $GUI_SHOW)
			GUICtrlSetState($image_about, $GUI_SHOW)

		Case $GUI_HIDE
			; Define here all elements to hide when user leave this view
			GUICtrlSetState($label_title_View_About, $GUI_HIDE)
			GUICtrlSetState($label_about, $GUI_HIDE)
			GUICtrlSetState($label_website, $GUI_HIDE)
			GUICtrlSetState($label_email, $GUI_HIDE)
			GUICtrlSetState($label_copyright, $GUI_HIDE)
			GUICtrlSetState($image_about, $GUI_HIDE)

	EndSwitch
EndFunc




;==============================================================================================================
; Handler for events in 'Welcome' view
;
; @param $msg, event return with GUIGetMsg method, i.e. the control ID of the control sending the message
; @return @void
;==============================================================================================================
Func _GUI_HandleEvents_View_About($msg)
	Switch $msg
		Case $label_website
			ConsoleWrite('Click on $label_website' & @CRLF)
			ShellExecute($APP_WEBSITE)

		Case $label_email
			ConsoleWrite('Click on $label_email' & @CRLF)
			ShellExecute("mailto:" & $APP_EMAIL_CONTACT & "?subject=[" & $APP_NAME & " - v" & $APP_VERSION & "] Your request")
	EndSwitch
EndFunc

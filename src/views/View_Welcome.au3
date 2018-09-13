#cs ----------------------------------------------------------------------------

Handler of the 'Welcome' view

@project        : ags-example-01-minimal
@version        : v1.0.0
@author         : v20100v <vb20100bv@gmail.com
@AGS framework  : v1.0.0
@AutoIt version : v3.3.14.5

#ce ----------------------------------------------------------------------------


#include-once


;===============================================================================
; Create element for the 'Welcome' view
;
; @param void
; @return void
;===============================================================================
Func _GUI_Init_View_Welcome()
	; GUI elements have to register in global scope
	GUISetFont(20, 800, 0, "Arial Narrow")
	Global $label_title_View_Welcome = GUICtrlCreateLabel("Welcome", 20, 30, 400)
	GUICtrlSetColor($label_title_View_Welcome, $APP_GUI_TITLE_COLOR)
	GUICtrlSetBkColor($label_title_View_Welcome, $GUI_BKCOLOR_TRANSPARENT)

	GUISetFont(10, 400, 0, "Segoe UI")
	Global $label_sample_AGS_project = GUICtrlCreateLabel("This application is a sample of a project built with AGS framework.", 20, 80)
	Global $label_sample_AGS_project_more_information = GUICtrlCreateLabel("You can find more information about AGS here :", 20, 114)
	Global $label_sample_AGS_project_link = GUICtrlCreateLabel("https://autoit-gui-skeleton.github.io/", 296, 114)
	GUICtrlSetColor($label_sample_AGS_project_link, $APP_GUI_LINK_COLOR)
	GUICtrlSetCursor($label_sample_AGS_project_link, 0)

	Global $label_welcome = GUICtrlCreateLabel( _
			"In this application, you can see: " & @CRLF & @CRLF & _
			" - How to create an application menu." & @CRLF & _
			" - How to handle an action from the menu (open/close file)." & @CRLF & _
			" - How to create a view." & @CRLF & _
			" - How to handle user interaction and events." & @CRLF & _
			" - How to make a static footer always display in application." & @CRLF & _
			" - How to use the configuration file parameters.ini to persit values." _
			, 20, 147)

	Global $label_openedFile = GUICtrlCreateLabel(" ", 20, 400, 500)
EndFunc


;===============================================================================
; Handler for display element on 'Welcome' view
;
; @param {int} $action, use GUIConstantsEx $GUI_SHOW or $GUI_HIDE
; @return void
;===============================================================================
Func _GUI_ShowHide_View_Welcome($action)
	Switch $action
		Case $GUI_SHOW
			; Define here all elements to show when user come into this view
			_GUI_Hide_all_view()
			GUICtrlSetState($label_title_View_Welcome, $GUI_SHOW)
			GUICtrlSetState($label_sample_AGS_project, $GUI_SHOW)
			GUICtrlSetState($label_sample_AGS_project_more_information, $GUI_SHOW)
			GUICtrlSetState($label_sample_AGS_project_link, $GUI_SHOW)
			GUICtrlSetState($label_welcome, $GUI_SHOW)
			GUICtrlSetState($label_openedFile, $GUI_SHOW)

		Case $GUI_HIDE
			; Define here all elements to hide when user leave this view
			GUICtrlSetState($label_title_View_Welcome, $GUI_HIDE)
			GUICtrlSetState($label_sample_AGS_project, $GUI_HIDE)
			GUICtrlSetState($label_sample_AGS_project_more_information, $GUI_HIDE)
			GUICtrlSetState($label_sample_AGS_project_link, $GUI_HIDE)
			GUICtrlSetState($label_welcome, $GUI_HIDE)
			GUICtrlSetState($label_openedFile, $GUI_HIDE)
	EndSwitch
EndFunc


;===============================================================================
; Handler for events in 'Welcome' view
;
; @param $msg, the control ID
; @return @void
;===============================================================================
Func _GUI_HandleEvents_View_Welcome($msg)
	Switch $msg

		; Trigger for click on $label_sample_AGS_project_link
		Case $label_sample_AGS_project_link
			ShellExecute('https://autoit-gui-skeleton.github.io/')

			; Add another trigger in view 'Welcome' here
	EndSwitch
EndFunc

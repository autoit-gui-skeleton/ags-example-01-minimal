#cs ----------------------------------------------------------------------------

Handler of the 'Footer' GUI elements. These elements are always display in each
view, so we don't need to add '_GUI_ShowHide_Footer' method.

@project        : ags-example-01-minimal
@version        : v1.0.0
@author         : v20100v <vb20100bv@gmail.com
@AGS framework  : v1.0.0
@AutoIt version : v3.3.14.5

#ce ----------------------------------------------------------------------------


#include-once


;===============================================================================
; Create footer element
;
; @param void
; @return void
;===============================================================================
Func _GUI_Init_Footer()
	GUISetFont(8, 400, 0, "Segoe UI")
	Global $label_copyright = GUICtrlCreateLabel($APP_COPYRIGHT, 5, $APP_HEIGHT - 38)
	Global $label_version_application = GUICtrlCreateLabel("v" & $APP_VERSION, $APP_WIDTH - StringLen("v" & $APP_VERSION) * 5, $APP_HEIGHT - 38)
	Global $img_trait = GUICtrlCreatePic("./assets/images/line.jpg", 0, $APP_HEIGHT - 45, 800, 2)
	GUISetFont(10, 400, 0, "Segoe UI")
EndFunc

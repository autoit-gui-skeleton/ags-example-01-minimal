#cs ----------------------------------------------------------------------------

Service for handling Windows dialog box

@project        : ags-example-01-minimal
@version        : v1.0.0
@author         : v20100v <vb20100bv@gmail.com
@AGS framework  : v1.0.0
@AutoIt version : v3.3.14.5

#ce ----------------------------------------------------------------------------


;===============================================================================
; Create an "open dialog box" and show it to user, and return the path and the
; name of selected file. If an error occurs, it returns -1.
;
; @params void
; @return $result (array)
;     -> $result[0] = the file path
;     -> $result[1] = the file name
;===============================================================================
Func SERVICES_Dialogbox_open_file()
	Local $fileInfo = _WinAPI_GetOpenFileName( _
		"Open file", "*.*", @WorkingDir, "", _
			"", 2, BitOR($OFN_ALLOWMULTISELECT, $OFN_EXPLORER), $OFN_EX_NOPLACESBAR)
	Local $result[2]

	If @error Then
		$result[0] = -1
		$result[1] = -1
	Else
		; The file path
		$result[0] = $fileInfo[1] & "\" & $fileInfo[2]
		; The file name
		$result[1] = $fileInfo[2]
	EndIf

	Return $result
EndFunc

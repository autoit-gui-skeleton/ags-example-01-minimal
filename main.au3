#cs ----------------------------------------------------------------------------

Main entry program of application.

@project        : ags-example-01-minimal
@version        : v1.0.0
@author         : v20100v <vb20100bv@gmail.com
@AGS framework  : v1.0.0
@AutoIt version : v3.3.14.5

This is the single point of entry for the application, and the location
where the application starts. In the latter, we begin by including all
other dependencies that it needs: AutoIt libraries, third-party libraries,
global variable declaration, and code for the GUI and application services.

More information about AGS framework here https://autoit-gui-skeleton.github.io

#ce ----------------------------------------------------------------------------


Opt('MustDeclareVars', 1)


;-------------------------------------------------------------------------------
; Built-in AutoIt library requires
;-------------------------------------------------------------------------------
#include <IE.au3>
#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>
#include <WinAPIDlg.au3>
#Include <WindowsConstants.au3>


;-------------------------------------------------------------------------------
; Constants and global variables
;
; All constants and global variables are set in one place './src/GLOBALS.au3',
; With the exception to global variables of graphic elements which are set in
; each specific view file. Don't forget that constants can't longer change their
; value over time, unlike global variables.
;
; By convention, all global variables must be written in capital letter and
; separated by underscore - for example : Global Const $APP_EMAIL_CONTACT
;-------------------------------------------------------------------------------
#include './src/GLOBALS.au3'


;-------------------------------------------------------------------------------
; Third-party code
;
; By convention all third-party code must be stored into the directory ./vendor/.
; In order to simplifiy handling dependencies of an AutoIt project, we use yarn
; and the npmjs.org repository to share AutoIt libraries. All AGS packages
; hosted in this npmjs repository belong to @autoit-gui-skeleton organization.
;
; You can find two types of packages hosted in this organization : AGS-component
; and AGS-wrapper. An AGS-component is an AutoIt library created specifically
; for AGS. You can use it more easily in your AutoIt project built with the
; AGS framework. An AGS-wrapper is a simple wrapper for another AutoIt library,
; created by another team/developper.
;
; To add a dependency in your project, we assume that you have already install
; Node.js and Yarn, so just type in the root folder of your project where
; the package.json is saved, this command :
;
; yarn add @autoit-gui-skeleton/ags-wrapper-json --modules-folder vendor
;
;-------------------------------------------------------------------------------
; #include "vendor/@autoit-gui-skeleton/...


;-------------------------------------------------------------------------------
; Main program that manages all the business code
;
; This is the entry point to business and logic code. This file can include
; another script store into './src/business/' folder, according to the needs of
; the application.
;-------------------------------------------------------------------------------
#include './src/BUSINESS.au3'


;-------------------------------------------------------------------------------
; Main program that manages all services
;
; This is the entry point to include all services. This file can include
; another service store into './src/services/' folder.
;-------------------------------------------------------------------------------
#include './src/SERVICES.au3'


;-------------------------------------------------------------------------------
; Main program that handles GUI
;
; It contains also the app_start() method which is designed to create the
; graphical user interface (GUI) and manage all user interactions and events
; occured in application.
;-------------------------------------------------------------------------------
#include './src/GUI.au3'



; Start the application
app_start()

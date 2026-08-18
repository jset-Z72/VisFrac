"
Primer canvas de roassal con SpRoassalPresenter
"
Class {
	#name : 'VisRoasCanvasExample',
	#superclass : 'SpRoassalPresenter',
	#instVars : [
		'shape',
		'posBox'
	],
	#category : 'Basic-VisRoassal',
	#package : 'Basic-VisRoassal'
}

{ #category : 'execution' }
VisRoasCanvasExample >> boxDown [

	posBox := posBox + (0@50).
	shape position: posBox.
	self refresh.
	self canvas add: shape.
]

{ #category : 'execution' }
VisRoasCanvasExample >> boxLeft [

	posBox := posBox - (50@0).
	shape position: posBox.
	self refresh.
	self canvas add: shape.
]

{ #category : 'execution' }
VisRoasCanvasExample >> boxRight [

	posBox := posBox + (50@0).
	shape position: posBox.
	self refresh.
	self canvas add: shape.
]

{ #category : 'execution' }
VisRoasCanvasExample >> boxUp [

	posBox := posBox - (0@50).
	shape position: posBox.
	self refresh.
	self canvas add: shape.
]

{ #category : 'initialization' }
VisRoasCanvasExample >> initializePresenters [

	super initializePresenters.
	posBox := 0 @ 0.
	shape := RSBox new
		         size: 50 @ 50;
		         color: Color red;
		         position: posBox.
	self canvas add: shape.
]

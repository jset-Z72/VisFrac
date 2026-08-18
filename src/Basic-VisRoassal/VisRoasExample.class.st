"
Controlador visual del CanvasRoassal
"
Class {
	#name : 'VisRoasExample',
	#superclass : 'SpPresenter',
	#instVars : [
		'visCanvas',
		'btLeft',
		'btRight',
		'btUp',
		'btDown'
	],
	#category : 'Basic-VisRoassal',
	#package : 'Basic-VisRoassal'
}

{ #category : 'layout' }
VisRoasExample >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: (SpBoxLayout newTopToBottom
			add: btUp expand: false;
			add: (SpBoxLayout newLeftToRight
				hAlignCenter; 
				add: btLeft expand: false;
				add: (self newLabel label: '      ');
				add: btRight expand: false;
				yourself
			);
			add: btDown expand: false;
			yourself
		);
		add: visCanvas withConstraints: [ :contraints |
			contraints width: 400; height:400.
			contraints expand: false.
		];
		yourself.
]

{ #category : 'initialization' }
VisRoasExample >> initializePresenters [

	visCanvas := self instantiate: VisRoasCanvasExample.
	btDown := self newButton label: 'j'; action: [ visCanvas boxDown. ].
	btUp := self newButton label: 'k'; action: [ visCanvas boxUp. ].
	btLeft := self newButton label: 'h'; action: [ visCanvas boxLeft. ].
	btRight := self newButton label: 'l'; action: [ visCanvas boxRight. ].
]

{ #category : 'initialization' }
VisRoasExample >> initializeWindow: aWindow [

	^ aWindow
		title: 'VisRoas Vizualicer';
		initialExtent: 700@400.
]

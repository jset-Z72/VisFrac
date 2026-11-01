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

{ #category : 'initialization' }
VisRoasExample >> connectPresenters [
    super connectPresenters.

    self whenBuiltDo: [ 
        self window ifNotNil: [ :winPresenter |
            winPresenter window 
                bindKeyCombination: $j asKeyCombination 
                toAction: [ visCanvas boxDown ].
				winPresenter window 
                bindKeyCombination: $k asKeyCombination 
                toAction: [ visCanvas boxUp ].
				winPresenter window 
                bindKeyCombination: $h asKeyCombination 
                toAction: [ visCanvas boxLeft ].
				winPresenter window 
                bindKeyCombination: $l asKeyCombination 
                toAction: [ visCanvas boxRight ]
        ]
    ]
]

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

{ #category : 'accessing' }
VisRoasExample >> visRoasCanvasGetter [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	^ visCanvas.
]

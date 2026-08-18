"
Baseline del proyecto
"
Class {
	#name : 'BaselineOfBasicVisRoassal',
	#superclass : 'BaselineOf',
	#category : 'Basic-VisRoassal',
	#package : 'Basic-VisRoassal'
}

{ #category : 'baselines' }
BaselineOfBasicVisRoassal >> baseline: spec [

	spec for: #common do: [ 
		spec baseline: 'Roassal'
			with: [ spec repository: 'github://pharo-graphics/Roassal' ];
			versionString: #stable.
		
		spec baseline: 'Spec2'
			with: [ spec repository: 'github://pharo-spec/Spec' ];
			versionString: #stable.
		
		spec package: 'Basic-VisRoassal' with: [ spec requires: #('Roassal' 'Spec2') ].
	].
]

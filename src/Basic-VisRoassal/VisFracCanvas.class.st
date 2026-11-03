"
Canvas para el trazador de fractales para el conjuntos de julia.
Los slots de la clase son los parámetros variables que utiliza el mismo
para representar los fractales.

- **iterSize** ==> Define la cantidad de iteraciones bajo la que se evaluan o validan los valores que pertenecen al conjunto.

- **origin** ==> Define el punto central (origen) donde se encuetra el conjunto, respecto al sistema de coordenadas complejo. Es decir, cuanto esta desplazado el conjunto del origen.

- **scale** ==> Define la escala o proporción para ambos ejes del tamaño del conjunto. En general este valor tiene una proporción base de 1/200px, es decir, que por cada 200px, hace una unidad, multiplicado por este valor adimencional de escala.
"
Class {
	#name : 'VisFracCanvas',
	#superclass : 'SpRoassalPresenter',
	#instVars : [
		'iterSize',
		'origin',
		'mixScapeColor',
		'fracSetColor',
		'scale'
	],
	#category : 'Basic-VisRoassal',
	#package : 'Basic-VisRoassal'
}

{ #category : 'execution' }
VisFracCanvas >> drawFrac [

	""
]

{ #category : 'initialization' }
VisFracCanvas >> initializePresenters [

	super initializePresenters.
	iterSize := 100.
	origin := 0@0.
	mixScapeColor := Color white.
	fracSetColor := Color black.
	scale := 1.
	
	self inform: (self canvas extent).
]

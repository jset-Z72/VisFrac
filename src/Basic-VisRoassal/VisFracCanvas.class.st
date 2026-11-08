"
Class: VisFracCanvas
                                                                                                    
Canvas para el trazador de fractales para el conjuntos de julia.
Los slots de la clase son los parámetros variables que utiliza el mismo
para representar los fractales.

- **iterSize** ==> Define la cantidad de iteraciones bajo la que se evaluan o validan los valores que pertenecen al conjunto.

- **origin** ==> Define el punto central (origen) donde se encuetra el conjunto, respecto al sistema de coordenadas complejo. Es decir, cuanto esta desplazado el conjunto del origen.

- **scale** ==> Define la escala o proporción para ambos ejes del tamaño del conjunto. En general este valor tiene una proporción base de 1/200px, es decir, que por cada 200px, hace una unidad, multiplicado por este valor adimencional de escala.

- **minScapeColor** ==> Color que presentan los valores complejos que no pertenecen al conjunto de julia.

- **fracSetColor** ==> Color de los valores complejos que si pertenecen al conjunto.

- **genFunc** ==> Es la función a evaluar para generar el conjunto de julia. esta se puede agregar con el setter _setGenFunc:_, o se puede generar directamente al trazar el fractal, con el mensaje _drawFrac:_.
"
Class {
	#name : 'VisFracCanvas',
	#superclass : 'SpRoassalPresenter',
	#instVars : [
		'iterSize',
		'origin',
		'minScapeColor',
		'fracSetColor',
		'scale',
		'genFunc'
	],
	#category : 'Basic-VisRoassal',
	#package : 'Basic-VisRoassal'
}

{ #category : 'getter' }
VisFracCanvas class >> defaultConfig [

	^ { 
		#iterSize -> 100.
		#origin -> (0@0).
		#minScapeColor -> (Color white).
		#fracSetColor -> (Color black).
		#scale -> 1.
		
		#maxRadiusRepr -> 2.
		
		#canvasWidth -> 500.
		#canvasHeight -> 500.
	} asDictionary.
]

{ #category : 'execution' }
VisFracCanvas >> drawFrac [

	""
]

{ #category : 'execution' }
VisFracCanvas >> drawFrac: aGenFunc [

	self setGenFunc: aGenFunc.
	self drawFrac.
]

{ #category : 'initialization' }
VisFracCanvas >> initializePresenters [

	| defaultConf |

	super initializePresenters.

	defaultConf := self class defaultConfig.
	iterSize := defaultConf at: #iterSize.
	origin := defaultConf at: #origin.
	minScapeColor := defaultConf at: #minScapeColor.
	fracSetColor := defaultConf at: #fracSetColor.
	scale := defaultConf at: #scale.
	
	self canvas extent: (defaultConf at: #canvasWidth)@(defaultConf at: #canvasHeight). 
	self inform: (self canvas extent).
]

{ #category : 'initialization' }
VisFracCanvas >> setGenFunc: aGenFunc [

	genFunc := aGenFunc.
]

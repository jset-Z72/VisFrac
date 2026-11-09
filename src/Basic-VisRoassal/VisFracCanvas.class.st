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
		'genFunc',
		'bitmap',
		'mapMask'
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
		"Para el ejemplo del genFunc para pruebas."
		#genFunc -> [ :x :c | 
			| a b |
			a := x x. b := x y.
			((a * a) - (b * b))@(2 * a * b) + c.
		].
		#defaultC -> (0.3@0.5).
	} asDictionary.
]

{ #category : 'execution' }
VisFracCanvas >> drawFrac [

	"Creación del fractal por defecto"
	| form defaultConf width height c |
	
	defaultConf := self class defaultConfig.
	width := defaultConf at: #canvasWidth. height := defaultConf at: #canvasHeight.
	c := defaultConf at: #defaultC.
	form := Form extent: width @ height depth: 32.
	
	1 to: width do: [ :w |
		1 to: height do: [ :h |
			| cScape z iterIndex|
			iterIndex := 1.
				z := ((w - (width / 2)) / (200 * scale)) @ ((h - (height / 2)) / (200 * scale)).
				  [ ((((z x)*(z x)) + ((z y)*(z y))) <= 4.0) and: (iterIndex < iterSize) ] whileTrue: [ 
					z := genFunc value: z value: c.
					iterIndex := iterIndex + 1.
				].
				cScape := (iterIndex = iterSize)
					ifTrue: [ fracSetColor ]
					ifFalse: [ minScapeColor ].
			
			form colorAt: w@h put: cScape.
			
		].
	].
	
	bitmap form: form.
	bitmap canvas signalUpdate.
]

{ #category : 'execution' }
VisFracCanvas >> drawFrac: aGenFunc [

	self setGenFunc: aGenFunc.
	self drawFrac.
]

{ #category : 'initialization' }
VisFracCanvas >> initializePresenters [

	| defaultConf width height |

	super initializePresenters.

	defaultConf := self class defaultConfig.
	iterSize := defaultConf at: #iterSize.
	origin := defaultConf at: #origin.
	minScapeColor := defaultConf at: #minScapeColor.
	fracSetColor := defaultConf at: #fracSetColor.
	scale := defaultConf at: #scale.
	genFunc := defaultConf at: #genFunc. 
	
	width := defaultConf at: #canvasWidth. height := defaultConf at: #canvasHeight. 
	self canvas extent: width @ height.
	
	"Creación de la máscara para generar fractales"
	"mapMask := Array new: (width * height).
	1 to: width do: [ :w |
		1 to: height do: [ :h |
			| result px py|
			px := w - ((width / 2) round: 0). py := h - ((height / 2) round: 0).
			result := ((((px*px) + (py*py)) sqrt / (200 * scale)) < 2).
			mapMask at: ((h-1)*width+w) put: result.
			].
		]."
	bitmap := RSBitmap new.
	self canvas add: bitmap.
	"La prueba de fuego"
	self drawFrac.
]

{ #category : 'initialization' }
VisFracCanvas >> setGenFunc: aGenFunc [

	genFunc := aGenFunc.
]

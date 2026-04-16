Class {
	#name : 'MpExporter',
	#superclass : 'Object',
	#instVars : [
		'idToObjectDict'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'exporting' }
MpExporter >> export: anObject id: id [ 
	idToObjectDict at: id put: anObject 
]

{ #category : 'initialization' }
MpExporter >> initialize [ 
	super initialize.
	idToObjectDict := Dictionary new
]

{ #category : 'accessing' }
MpExporter >> objectAt: id [
	^idToObjectDict at: id
]

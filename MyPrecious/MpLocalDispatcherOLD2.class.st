Class {
	#name : 'MpLocalDispatcherOLD2',
	#superclass : 'Object',
	#instVars : [
		'idToObjectDict'
	],
	#category : 'MyPrecious-Kernel-OLD2',
	#package : 'MyPrecious',
	#tag : 'Kernel-OLD2'
}

{ #category : 'dispatching' }
MpLocalDispatcherOLD2 >> dispatch: aMessage targetReference: anId [

	| target |
	target := idToObjectDict at: anId.
	^ aMessage sendTo: target
]

{ #category : 'exporting' }
MpLocalDispatcherOLD2 >> export: anObjectToExport id: anId [
	idToObjectDict at: anId put: anObjectToExport
]

{ #category : 'accessing' }
MpLocalDispatcherOLD2 >> exportedObjectAt: anId [

	^ idToObjectDict at: anId
]

{ #category : 'initialization' }
MpLocalDispatcherOLD2 >> initialize [

	super initialize.
	idToObjectDict := Dictionary new
]

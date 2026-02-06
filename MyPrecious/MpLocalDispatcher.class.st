Class {
	#name : 'MpLocalDispatcher',
	#superclass : 'MpDispatcher',
	#instVars : [
		'idToObjectDict'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'dispatching' }
MpLocalDispatcher >> dispatch: aMessage targetId: anId [

	| target |
	target := idToObjectDict at: anId.
	^ aMessage sendTo: target
]

{ #category : 'exporting' }
MpLocalDispatcher >> export: anObjectToExport id: anId [
	idToObjectDict at: anId put: anObjectToExport
]

{ #category : 'accessing' }
MpLocalDispatcher >> exportedObjectAt: anId [

	^ idToObjectDict at: anId
]

{ #category : 'initialization' }
MpLocalDispatcher >> initialize [

	super initialize.
	idToObjectDict := Dictionary new
]

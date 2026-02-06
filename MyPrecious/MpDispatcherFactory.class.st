Class {
	#name : 'MpDispatcherFactory',
	#superclass : 'Object',
	#instVars : [
		'addressToDispatcherDict'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'building' }
MpDispatcherFactory >> dispatcherAt: anAddress [
	^addressToDispatcherDict at: anAddress ifAbsentPut: [ self newDispatcherFrom: anAddress ]
]

{ #category : 'initialization' }
MpDispatcherFactory >> initialize [ 
	super initialize.
	addressToDispatcherDict := Dictionary new
]

{ #category : 'building' }
MpDispatcherFactory >> newDispatcherFrom: anAddress [

	^ anAddress asDispatcher
]

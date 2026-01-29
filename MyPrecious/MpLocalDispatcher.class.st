Class {
	#name : 'MpLocalDispatcher',
	#superclass : 'MpDispatcher',
	#instVars : [
		'referenceDict'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
MpLocalDispatcher >> at: reference [
	^referenceDict at: reference 
]

{ #category : 'accessing' }
MpLocalDispatcher >> at: reference put: targetObject [
	referenceDict at: reference put:targetObject 
]

{ #category : 'dispatching' }
MpLocalDispatcher >> dispatch: aMessage targetReference: aReference [

	| target |
	target := self at: aReference.
	^aMessage sendTo: target
]

{ #category : 'initialization' }
MpLocalDispatcher >> initialize [

	super initialize.
	referenceDict := Dictionary new
]

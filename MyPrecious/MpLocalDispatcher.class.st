"
Deserializes and unmarshalls messages before delivering them to the receiver.
Receiver is found based on provided ID.
Receiver is assumed to be previously exported with the given ID.
"
Class {
	#name : 'MpLocalDispatcher',
	#superclass : 'MpDispatcher',
	#instVars : [
		'exporter'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'message handling' }
MpLocalDispatcher >> dispatch: aMessage targetId: id [
	| receiver |
	receiver := self objectAt: id.
	^aMessage sendTo: receiver
]

{ #category : 'accessing' }
MpLocalDispatcher >> exporter [

	^ exporter
]

{ #category : 'accessing' }
MpLocalDispatcher >> exporter: anObject [

	exporter := anObject
]

{ #category : 'initialization' }
MpLocalDispatcher >> initialize [ 
	super initialize.
	exporter := MpExporter new
]

{ #category : 'accessing' }
MpLocalDispatcher >> objectAt: id [
	^self exporter objectAt: id
]

"
Deserializes and unmarshalls messages before delivering them to the receiver.
Receiver is found based on provided ID.
Receiver is assumed to be previously exported with the given ID.

Response is marshalled then serialized before returning it.
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
	| receiver rawResponse |
	receiver := self objectAt: id.
	rawResponse := aMessage sendTo: receiver.
	^self marashal: rawResponse
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

{ #category : 'message handling' }
MpLocalDispatcher >> marashal: anObject [
	^marshaler marashal: anObject
]

{ #category : 'accessing' }
MpLocalDispatcher >> objectAt: id [
	^self exporter objectAt: id
]

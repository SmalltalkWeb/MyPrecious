"
Handles outgoing messages to specific host
"
Class {
	#name : 'MpSender',
	#superclass : 'Object',
	#instVars : [
		'address'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
MpSender class >> address: anAddress [
	^self new
		address: anAddress;
		yourself
]

{ #category : 'accessing' }
MpSender >> address [

	^ address
]

{ #category : 'accessing' }
MpSender >> address: anObject [

	address := anObject
]

{ #category : 'message handling' }
MpSender >> dispatch: aMessage targetId: id [
	self subclassResponsibility 
]

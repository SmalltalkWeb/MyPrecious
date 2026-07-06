"
Serializes and marshalls messages before passing them to the target's remote reference.
Then deserializes and umarshalls responses before returning them.
"
Class {
	#name : 'MpRemoteDispatcher',
	#superclass : 'MpDispatcher',
	#instVars : [
		'idToProxyDict',
		'sender'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
MpRemoteDispatcher class >> address: aMpAddress marshaler: aMarshaler [
	^self new
		address: aMpAddress;
		marshaler: aMarshaler;
		yourself
]

{ #category : 'accessing' }
MpRemoteDispatcher >> address [
	^self sender address
]

{ #category : 'accessing' }
MpRemoteDispatcher >> address: anMpAddress [
	self sender: anMpAddress asSender 
]

{ #category : 'message handling' }
MpRemoteDispatcher >> dispatch: rawMessage targetId: id [

	| rawResponse marshaledMessage |
	marshaledMessage := self marshal: rawMessage.
	rawResponse := self sender dispatch: marshaledMessage targetId: id.
	^ self unmarshal: rawResponse
]

{ #category : 'initialization' }
MpRemoteDispatcher >> initialize [ 
	super initialize.
	idToProxyDict := Dictionary new
]

{ #category : 'accessing' }
MpRemoteDispatcher >> marshaler: anObject [

	marshaler := anObject
]

{ #category : 'proxies' }
MpRemoteDispatcher >> newProxyAt: id [
	^MpProxy id: id dispatcher: self
]

{ #category : 'proxies' }
MpRemoteDispatcher >> proxyAt: id [  
	^idToProxyDict at: id ifAbsentPut: [ self newProxyAt: id ]
]

{ #category : 'accessing' }
MpRemoteDispatcher >> sender [

	^ sender
]

{ #category : 'accessing' }
MpRemoteDispatcher >> sender: anObject [

	sender := anObject
]

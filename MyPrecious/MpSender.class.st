"
Serializes and marshalls messages before passing them to the target's remote reference.
Then deserializes and umarshalls responses before returning them.
"
Class {
	#name : 'MpSender',
	#superclass : 'MpTransporter',
	#instVars : [
		'idToProxyDict',
		'address'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
MpSender class >> address: anAddress marshaler: aMarshaler [
	^self new
		address: anAddress;
		marshaler: aMarshaler;
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
MpSender >> basicSend: aMessage targetId: id [

	self subclassResponsibility
]

{ #category : 'initialization' }
MpSender >> initialize [ 
	super initialize.
	idToProxyDict := Dictionary new
]

{ #category : 'proxies' }
MpSender >> newProxyAt: id [
	^MpProxy id: id sender: self
]

{ #category : 'proxies' }
MpSender >> proxyAt: id [  
	^idToProxyDict at: id ifAbsentPut: [ self newProxyAt: id ]
]

{ #category : 'message handling' }
MpSender >> send: rawMessage targetId: id [

	| rawResponse marshaledMessage |
	marshaledMessage := self marshal: rawMessage.
	rawResponse := self basicSend: marshaledMessage targetId: id.
	^ self unmarshal: rawResponse
]

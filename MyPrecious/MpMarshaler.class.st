Class {
	#name : 'MpMarshaler',
	#superclass : 'Object',
	#instVars : [
		'exporter',
		'address',
		'addressToSenderDict'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
MpMarshaler >> address [

	^ address
]

{ #category : 'accessing' }
MpMarshaler >> address: anObject [

	address := anObject
]

{ #category : 'accessing' }
MpMarshaler >> exporter [

	^ exporter
]

{ #category : 'marshalling low level' }
MpMarshaler >> idAt: anObject [  
	^self exporter idAt: anObject  
]

{ #category : 'initialization' }
MpMarshaler >> initialize [

	super initialize.
	exporter := MpExporter new.
	addressToSenderDict := Dictionary new
]

{ #category : 'marshalling top level' }
MpMarshaler >> marshal: anObject [
	^anObject marshalWith: self
]

{ #category : 'marshalling top level' }
MpMarshaler >> marshalMessage: aMessage [

	| marshaledArgs |
	marshaledArgs := aMessage arguments collect: [: each | self marshal: each]. 
	^Message selector: aMessage selector arguments: marshaledArgs
]

{ #category : 'marshalling top level' }
MpMarshaler >> marshalObject: anObject [

	| id |
	anObject isPassByCopy ifTrue: [ ^anObject ].
	id := self idAt: anObject.
	^MpRemoteReference id: id address: self address
]

{ #category : 'marshalling top level' }
MpMarshaler >> marshalProxyId: id dispatcher: dispatcher [ 
	^MpRemoteReference id: id address: dispatcher address
]

{ #category : 'creating proxies' }
MpMarshaler >> newSenderFromAddress: anMpAddress [

	^ anMpAddress asSenderMarshaler: self
]

{ #category : 'marshalling low level' }
MpMarshaler >> objectAt: id [  
	^self exporter objectAt: id
]

{ #category : 'creating proxies' }
MpMarshaler >> proxyAtId: id address: anMpAddress [ 
	| sender |
	sender := self senderFromAddress: anMpAddress.
	^sender proxyAt: id

]

{ #category : 'accessing' }
MpMarshaler >> proxyFactory [

	^ self
]

{ #category : 'creating proxies' }
MpMarshaler >> senderFromAddress: anMpAddress [

	^addressToSenderDict 
		at: anMpAddress 
		ifAbsentPut: [self newSenderFromAddress: anMpAddress ].
	
]

{ #category : 'marshalling top level' }
MpMarshaler >> unmarshal: anObject [
	^anObject unmarshalWith: self
]

{ #category : 'marshalling top level' }
MpMarshaler >> unmarshalMessage: aMessage [

	| unmarshaledArgs |
	unmarshaledArgs := aMessage arguments collect: [: each | self unmarshal: each]. 
	^Message selector: aMessage selector arguments: unmarshaledArgs
]

{ #category : 'marshalling top level' }
MpMarshaler >> unmarshalObject: anObject [
	^anObject 	
]

{ #category : 'marshalling top level' }
MpMarshaler >> unmarshalRemoteReference: aRemoteReference [
	aRemoteReference address = self address ifTrue: [ ^self objectAt: aRemoteReference id ].
	^self 
		proxyAtId: aRemoteReference id 
		address: aRemoteReference address
]

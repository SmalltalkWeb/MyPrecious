Class {
	#name : 'MpMarshaler',
	#superclass : 'Object',
	#instVars : [
		'exporter',
		'address',
		'proxyFactory'
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

{ #category : 'accessing' }
MpMarshaler >> exporter: anObject [

	exporter := anObject
]

{ #category : 'marshalling low level' }
MpMarshaler >> idAt: anObject [  
	^self exporter idAt: anObject  
]

{ #category : 'initialization' }
MpMarshaler >> initialize [ 
	super initialize.
	exporter := MpExporter new.
	proxyFactory := MpProxyFactory new.
	proxyFactory marshaler: self

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

{ #category : 'marshalling low level' }
MpMarshaler >> objectAt: id [  
	^self exporter objectAt: id
]

{ #category : 'marshalling low level' }
MpMarshaler >> proxyAtId: id address: anMpAddress [
	^ self proxyFactory proxyAtId: id address: anMpAddress
]

{ #category : 'accessing' }
MpMarshaler >> proxyFactory [

	^ proxyFactory
]

{ #category : 'accessing' }
MpMarshaler >> proxyFactory: anObject [

	proxyFactory := anObject
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
	aRemoteReference address == self address ifTrue: [ ^self objectAt: aRemoteReference id ].
	^self 
		proxyAtId: aRemoteReference id 
		address: aRemoteReference address
]

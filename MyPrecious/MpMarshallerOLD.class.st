Class {
	#name : 'MpMarshallerOLD',
	#superclass : 'MpMiddlewarePartOLD',
	#category : 'MyPrecious-Kernel-OLD',
	#package : 'MyPrecious',
	#tag : 'Kernel-OLD'
}

{ #category : 'marshalling' }
MpMarshallerOLD >> marshal: anObject [ 
	^anObject marshalWith: self
]

{ #category : 'marshalling' }
MpMarshallerOLD >> marshalNormalResponse: response [ 
	| marshalledResult |
	marshalledResult := self marshal: response result.
	^response
		result: marshalledResult;
		yourself
]

{ #category : 'marshalling' }
MpMarshallerOLD >> marshalObject: anObject [ 
	anObject isPassByCopy ifTrue: [ ^anObject ].
	^self remoteReferenceFor: anObject
]

{ #category : 'marshalling' }
MpMarshallerOLD >> marshalRemoteMessage: message [ 
	|marshalledArgs marshalledReceiver |
	marshalledReceiver := self marshal: message receiver.
	marshalledArgs := message arguments collect: [ : each | self marshal: each ].
	^message 
		arguments: marshalledArgs;
		receiver: marshalledReceiver; 
		yourself.
]

{ #category : 'marshalling' }
MpMarshallerOLD >> marshalRemoteReference: aRemoteReference [
	^aRemoteReference
]

{ #category : 'marshalling' }
MpMarshallerOLD >> marshallExceptionResponse: aMmExceptionResponse [ 
	| marshalledException |
	marshalledException := MpRemoteExceptionWrapperOLD on: aMmExceptionResponse exception.
	^aMmExceptionResponse
		exception: marshalledException;
		yourself
]

{ #category : 'accessing' }
MpMarshallerOLD >> objectAt: aRemoteReference [
	^self referenceConverter objectAt: aRemoteReference
]

{ #category : 'accessing' }
MpMarshallerOLD >> referenceConverter [
	^self middleware referenceConverter
]

{ #category : 'accessing' }
MpMarshallerOLD >> remoteReferenceFor: anObject [ 
	^self referenceConverter remoteReferenceFor: anObject
]

{ #category : 'marshalling' }
MpMarshallerOLD >> unmarshal: anObject [ 
	^anObject unmarshalWith: self
]

{ #category : 'marshalling' }
MpMarshallerOLD >> unmarshalNormalResponse: response [ 
	| unmarshalledResult |
	unmarshalledResult := self unmarshal: response result.
	^response
		result: unmarshalledResult;
		yourself
]

{ #category : 'marshalling' }
MpMarshallerOLD >> unmarshalObject: anObject [ 
	^anObject
]

{ #category : 'marshalling' }
MpMarshallerOLD >> unmarshalRemoteMessage: message [ 
	|unmarshalledArgs unmarshalledReceiver |
	unmarshalledReceiver := self unmarshal: message receiver.
	unmarshalledArgs := message arguments collect: [ : each | self unmarshal: each ].
	^message 
		arguments: unmarshalledArgs;
		receiver: unmarshalledReceiver; 
		yourself.
]

{ #category : 'marshalling' }
MpMarshallerOLD >> unmarshalRemoteReference: aRemoteReference [
	^self objectAt: aRemoteReference
]

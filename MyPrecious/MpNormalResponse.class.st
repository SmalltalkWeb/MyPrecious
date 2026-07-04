Class {
	#name : 'MpNormalResponse',
	#superclass : 'MpResponse',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'marshaling' }
MpNormalResponse >> unmarshalWith: aMarshaler [

	value := value unmarshalWith: aMarshaler
]

{ #category : 'evaluating' }
MpNormalResponse >> value [
	^self basicValue 
]

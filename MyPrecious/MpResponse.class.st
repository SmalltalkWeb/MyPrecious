Class {
	#name : 'MpResponse',
	#superclass : 'Object',
	#instVars : [
		'value'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
MpResponse class >> value: anObject [
	^self new
		value: anObject;
		yourself
]

{ #category : 'accessing' }
MpResponse >> basicValue [
	^value
]

{ #category : 'marshaling' }
MpResponse >> marshalWith: aMarshaler [

	value := value marshalWith: aMarshaler
]

{ #category : 'marshaling' }
MpResponse >> unmarshalWith: aMarshaler [

	self subclassResponsibility 
]

{ #category : 'evaluating' }
MpResponse >> value [
	self subclassResponsibility 
]

{ #category : 'accessing' }
MpResponse >> value: anObject [

	value := anObject
]

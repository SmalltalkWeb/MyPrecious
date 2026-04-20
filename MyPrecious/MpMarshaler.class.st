Class {
	#name : 'MpMarshaler',
	#superclass : 'Object',
	#instVars : [
		'exporter'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
MpMarshaler >> exporter [

	^ exporter
]

{ #category : 'accessing' }
MpMarshaler >> exporter: anObject [

	exporter := anObject
]

{ #category : 'initialization' }
MpMarshaler >> initialize [ 
	super initialize.
	self exporter: MpExporter new
]

{ #category : 'marshalling' }
MpMarshaler >> marashal: anObject [
	^anObject marshalWith: self
]

{ #category : 'marshalling' }
MpMarshaler >> marshalObject: anObject [

	InformativeNotification signal: 'marshalObject: TODO'.
	^ anObject "	anObject isPassByCopy ifTrue: [ ^anObject ].
	^self remoteReferenceFor: anObject"
]

{ #category : 'marshalling' }
MpMarshaler >> marshalRemoteReference: aRemoteReference [
	^aRemoteReference
]

{ #category : 'marshalling' }
MpMarshaler >> remoteReferenceFor: anObject [
	^MpRemoteReference new
]

{ #category : 'marshalling' }
MpMarshaler >> unmarshalObject: anObject [
	^anObject 	
]

{ #category : 'marshalling' }
MpMarshaler >> unmarshalRemoteReference: aRemoteReference [
	^aRemoteReference
]

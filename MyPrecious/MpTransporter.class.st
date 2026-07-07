"
Dispatchs messages
"
Class {
	#name : 'MpTransporter',
	#superclass : 'Object',
	#instVars : [
		'marshaler'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
MpTransporter >> address [
	self subclassResponsibility 
]

{ #category : 'accessing' }
MpTransporter >> address: anAddress [

	self subclassResponsibility
]

{ #category : 'message handling' }
MpTransporter >> marshal: anObject [
	^marshaler marshal: anObject
]

{ #category : 'accessing' }
MpTransporter >> marshaler [

	^ marshaler
]

{ #category : 'accessing' }
MpTransporter >> marshaler: anObject [

	marshaler := anObject
]

{ #category : 'accessing' }
MpTransporter >> serializer [
	^MpSerializer 
]

{ #category : 'message handling' }
MpTransporter >> unmarshal: anObject [
	^marshaler unmarshal: anObject
]

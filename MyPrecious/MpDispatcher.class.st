"
Dispatchs messages
"
Class {
	#name : 'MpDispatcher',
	#superclass : 'Object',
	#instVars : [
		'marshaler'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'message handling' }
MpDispatcher >> dispatch: aMessage targetId: id [

	self subclassResponsibility 
]

{ #category : 'message handling' }
MpDispatcher >> marshal: anObject [
	^marshaler marshal: anObject
]

{ #category : 'accessing' }
MpDispatcher >> marshaler [

	^ marshaler
]

{ #category : 'message handling' }
MpDispatcher >> unmarshal: anObject [
	^marshaler unmarshal: anObject
]

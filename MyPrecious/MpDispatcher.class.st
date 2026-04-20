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
MpDispatcher >> marashal: anObject [
	^marshaler marashal: anObject
]

{ #category : 'accessing' }
MpDispatcher >> marshaler [

	^ marshaler
]

{ #category : 'accessing' }
MpDispatcher >> marshaler: anObject [

	marshaler := anObject
]

{ #category : 'message handling' }
MpDispatcher >> unmarashal: anObject [
	^marshaler unmarashal: anObject
]

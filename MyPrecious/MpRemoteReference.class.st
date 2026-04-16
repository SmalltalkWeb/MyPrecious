Class {
	#name : 'MpRemoteReference',
	#superclass : 'Object',
	#instVars : [
		'id',
		'gateway'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance' }
MpRemoteReference class >> id: id gateway: aMpGateway [
	^self new
		id: id;
		gateway: aMpGateway;
		yourself
]

{ #category : 'message handling' }
MpRemoteReference >> dispatch: aMessage [
	^gateway dispatch: aMessage targetId: id 
]

{ #category : 'accessing' }
MpRemoteReference >> gateway [

	^ gateway
]

{ #category : 'accessing' }
MpRemoteReference >> gateway: anObject [

	gateway := anObject
]

{ #category : 'accessing' }
MpRemoteReference >> id [

	^ id
]

{ #category : 'accessing' }
MpRemoteReference >> id: anObject [

	id := anObject
]

Class {
	#name : 'MpRemoteMessage',
	#superclass : 'Object',
	#instVars : [
		'receiverID',
		'message'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
MpRemoteMessage class >> receiverID: id message: aMessage [
	^self new
		receiverID: id;
		message: aMessage;
		yourself 
]

{ #category : 'accessing' }
MpRemoteMessage >> message [

	^ message
]

{ #category : 'accessing' }
MpRemoteMessage >> message: anObject [

	message := anObject
]

{ #category : 'accessing' }
MpRemoteMessage >> receiverID [

	^ receiverID
]

{ #category : 'accessing' }
MpRemoteMessage >> receiverID: anObject [

	receiverID := anObject
]

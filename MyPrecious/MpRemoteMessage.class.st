Class {
	#name : 'MpRemoteMessage',
	#superclass : 'Message',
	#instVars : [
		'id',
		'receiverId'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
MpRemoteMessage >> id [

	^ id
]

{ #category : 'accessing' }
MpRemoteMessage >> id: anObject [

	id := anObject
]

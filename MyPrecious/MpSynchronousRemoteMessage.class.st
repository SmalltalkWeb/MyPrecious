Class {
	#name : 'MpSynchronousRemoteMessage',
	#superclass : 'MpRemoteMessageOLD',
	#instVars : [
		'responseId',
		'senderAddress'
	],
	#category : 'MyPrecious-Messages-OLD',
	#package : 'MyPrecious',
	#tag : 'Messages-OLD'
}

{ #category : 'communicating' }
MpSynchronousRemoteMessage >> deliverBy: transporter [
	transporter deliverSynchronousMessage: self
]

{ #category : 'accessing' }
MpSynchronousRemoteMessage >> responseId [
	^ responseId
]

{ #category : 'accessing' }
MpSynchronousRemoteMessage >> responseId: anObject [
	responseId := anObject
]

{ #category : 'accessing' }
MpSynchronousRemoteMessage >> senderAddress [
	^ senderAddress
]

{ #category : 'accessing' }
MpSynchronousRemoteMessage >> senderAddress: anObject [
	senderAddress := anObject
]

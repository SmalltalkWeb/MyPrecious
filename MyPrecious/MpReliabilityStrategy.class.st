Class {
	#name : 'MpReliabilityStrategy',
	#superclass : 'Object',
	#instVars : [
		'transporter'
	],
	#category : 'MyPrecious-Connected-OLD',
	#package : 'MyPrecious',
	#tag : 'Connected-OLD'
}

{ #category : 'sending' }
MpReliabilityStrategy >> basicSendAsynchronousMessage: remoteMessage to: targetRemoteReference [
	^ self transporter
		basicSendAsynchronousMessage: remoteMessage
		to: targetRemoteReference
]

{ #category : 'sending' }
MpReliabilityStrategy >> basicSendSynchronousMessage: remoteMessage to: targetRemoteReference [
	^ self transporter
		basicSendSynchronousMessage: remoteMessage
		to: targetRemoteReference
]

{ #category : 'sending' }
MpReliabilityStrategy >> sendAsynchronousMessage: remoteMessage to: targetRemoteReference [
	self subclassResponsibility
]

{ #category : 'sending' }
MpReliabilityStrategy >> sendSynchronousMessage: remoteMessage to: targetRemoteReference [
	self subclassResponsibility

]

{ #category : 'accessing' }
MpReliabilityStrategy >> transporter [
	^ transporter
]

{ #category : 'accessing' }
MpReliabilityStrategy >> transporter: anObject [
	transporter := anObject
]

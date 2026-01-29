Class {
	#name : 'MpAsynchronousRemoteMessage',
	#superclass : 'MpRemoteMessage',
	#category : 'MyPrecious-Messages-OLD',
	#package : 'MyPrecious',
	#tag : 'Messages-OLD'
}

{ #category : 'communicating' }
MpAsynchronousRemoteMessage >> deliverBy: transporter [
	transporter deliverAsynchronousMessage: self
]

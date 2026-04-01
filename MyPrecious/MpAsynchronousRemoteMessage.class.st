Class {
	#name : 'MpAsynchronousRemoteMessage',
	#superclass : 'MpRemoteMessageOLD',
	#category : 'MyPrecious-Messages-OLD',
	#package : 'MyPrecious',
	#tag : 'Messages-OLD'
}

{ #category : 'communicating' }
MpAsynchronousRemoteMessage >> deliverBy: transporter [
	transporter deliverAsynchronousMessage: self
]

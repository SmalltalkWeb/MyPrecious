Class {
	#name : 'MpCouldNotDeliverMessageError',
	#superclass : 'MpRemoteMessagingError',
	#category : 'MyPrecious-Kernel-OLD',
	#package : 'MyPrecious',
	#tag : 'Kernel-OLD'
}

{ #category : 'accessing' }
MpCouldNotDeliverMessageError >> defaultMessageText [
	^'Could not deliver remote message '
]

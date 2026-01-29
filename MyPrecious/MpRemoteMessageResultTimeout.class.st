Class {
	#name : 'MpRemoteMessageResultTimeout',
	#superclass : 'MpRemoteMessagingError',
	#category : 'MyPrecious-Kernel-OLD',
	#package : 'MyPrecious',
	#tag : 'Kernel-OLD'
}

{ #category : 'accessing' }
MpRemoteMessageResultTimeout >> defaultMessageText [
	^'Timeout waiting for response for remote message '.

]

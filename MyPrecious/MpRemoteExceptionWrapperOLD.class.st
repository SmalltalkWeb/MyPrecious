Class {
	#name : 'MpRemoteExceptionWrapperOLD',
	#superclass : 'Error',
	#category : 'MyPrecious-Kernel-OLD',
	#package : 'MyPrecious',
	#tag : 'Kernel-OLD'
}

{ #category : 'instance creation' }
MpRemoteExceptionWrapperOLD class >> on: exception [
	^self new
		messageText: exception description;
		yourself
]

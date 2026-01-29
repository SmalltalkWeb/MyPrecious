Class {
	#name : 'MpRemoteExceptionWrapper',
	#superclass : 'Error',
	#category : 'MyPrecious-Kernel-OLD',
	#package : 'MyPrecious',
	#tag : 'Kernel-OLD'
}

{ #category : 'instance creation' }
MpRemoteExceptionWrapper class >> on: exception [
	^self new
		messageText: exception description;
		yourself
]

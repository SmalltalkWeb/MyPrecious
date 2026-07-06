Class {
	#name : 'MpInMemorySender',
	#superclass : 'MpSender',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'message handling' }
MpInMemorySender >> dispatch: aMessage targetId: id [
	^self targetDispatcher dispatch: aMessage targetId: id
]

{ #category : 'accessing' }
MpInMemorySender >> targetDispatcher [ 
	^self address targetDispatcher 
]

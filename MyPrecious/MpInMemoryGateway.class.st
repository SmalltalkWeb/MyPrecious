Class {
	#name : 'MpInMemoryGateway',
	#superclass : 'MpGateway',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'message handling' }
MpInMemoryGateway >> dispatch: aMessage targetId: id [
	^self targetDispatcher dispatch: aMessage targetId: id
]

{ #category : 'accessing' }
MpInMemoryGateway >> targetDispatcher [ 
	^self address targetDispatcher 
]

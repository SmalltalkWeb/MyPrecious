Class {
	#name : 'MpInMemoryGateway',
	#superclass : 'MpGateway',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
MpInMemoryGateway >> targetDispatcher [ 
	^self address targetDispatcher 
]

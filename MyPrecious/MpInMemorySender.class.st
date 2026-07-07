Class {
	#name : 'MpInMemorySender',
	#superclass : 'MpSender',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'message handling' }
MpInMemorySender >> basicSend: aMessage targetId: id [

	^ self receiver receive: aMessage targetId: id
]

{ #category : 'accessing' }
MpInMemorySender >> receiver [ 
	^self address receiver 
]

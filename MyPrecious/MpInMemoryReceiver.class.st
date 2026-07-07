Class {
	#name : 'MpInMemoryReceiver',
	#superclass : 'MpReceiver',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'initialization' }
MpInMemoryReceiver >> newAddress [

	^ MpInMemoryAddress receiver: self
]

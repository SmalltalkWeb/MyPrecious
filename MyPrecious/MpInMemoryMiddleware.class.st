Class {
	#name : 'MpInMemoryMiddleware',
	#superclass : 'MpMiddleware',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'initialization' }
MpInMemoryMiddleware >> newAddress [

	^MpInMemoryAddress targetDispatcher: self localDispatcher 
]

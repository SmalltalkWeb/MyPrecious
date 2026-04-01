Class {
	#name : 'MpInMemoryMiddleware',
	#superclass : 'MpMiddleware',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
MpInMemoryMiddleware >> address [
	^MpInMemoryAddress targetDispatcher: self localDispatcher 
]

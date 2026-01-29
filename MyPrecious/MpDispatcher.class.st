Class {
	#name : 'MpDispatcher',
	#superclass : 'Object',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'dispatching' }
MpDispatcher >> dispatch: aMessage targetReference: reference [
	self subclassResponsibility 
]

Class {
	#name : 'MpAddress',
	#superclass : 'Object',
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'converting' }
MpAddress >> asGateway [
	^self gatewayClass address: self
]

{ #category : 'converting' }
MpAddress >> gatewayClass [
	self subclassResponsibility 
]

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
MpAddress >> asSenderMarshaler: aMarshaler [
	^self senderClass address: self marshaler: aMarshaler 
]

{ #category : 'converting' }
MpAddress >> senderClass [
	self subclassResponsibility 
]

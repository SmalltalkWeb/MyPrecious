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
MpAddress >> asSender [
	^self senderClass address: self
]

{ #category : 'converting' }
MpAddress >> senderClass [
	self subclassResponsibility 
]

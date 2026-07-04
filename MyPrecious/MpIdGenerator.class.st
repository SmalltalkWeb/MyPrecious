Class {
	#name : 'MpIdGenerator',
	#superclass : 'Object',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'generating' }
MpIdGenerator class >> newId [
	^UUID new asString36 
]

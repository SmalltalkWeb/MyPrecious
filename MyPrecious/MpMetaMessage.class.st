Class {
	#name : 'MpMetaMessage',
	#superclass : 'Object',
	#category : 'MyPrecious-Connected-OLD',
	#package : 'MyPrecious',
	#tag : 'Connected-OLD'
}

{ #category : 'communicating' }
MpMetaMessage >> deliverBy: transporter [
	self subclassResponsibility
]

{ #category : 'testing' }
MpMetaMessage >> isPassByCopy [
	^true
]

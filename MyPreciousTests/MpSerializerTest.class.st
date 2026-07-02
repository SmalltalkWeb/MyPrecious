Class {
	#name : 'MpSerializerTest',
	#superclass : 'TestCase',
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'tests' }
MpSerializerTest >> roundTrip: anObject [
	| bytes |
	bytes := MpSerializer serialize: anObject.
	^MpSerializer materializeFromBytes: bytes
]

{ #category : 'tests' }
MpSerializerTest >> testBasicObjectsIdentityPreserved [
	{nil. true. false. 128. -42. Float pi} do: [ : original |
		self assert: (self roundTrip: original) identicalTo: original] 
]

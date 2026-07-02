Class {
	#name : 'MpSerializer',
	#superclass : 'Object',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'serialize/materialize' }
MpSerializer class >> materializeFromBytes: bytes [
	^bytes readStreamDo: [ : stream | 
		self materializeFromStream: stream ]
]

{ #category : 'serialize/materialize' }
MpSerializer class >> materializeFromStream: aStream [
	| bytes bytesSize sizeDigitsCount |
	sizeDigitsCount := aStream next asInteger.
	bytesSize := (aStream next: sizeDigitsCount) asInteger.
	bytes := aStream next: bytesSize.
	^FLMaterializer materializeFromByteArray: bytes
]

{ #category : 'serialize/materialize' }
MpSerializer class >> serialize: anObject [ 
	^ByteArray streamContents: [ : stream |
		self serialize: anObject toStream: stream]
]

{ #category : 'serialize/materialize' }
MpSerializer class >> serialize: anObject toStream: aStream [
	| bytes bytesSize sizeDigitsCount |
	bytes := FLSerializer serializeToByteArray: anObject.
	bytesSize := bytes size asByteArray.
	sizeDigitsCount := bytesSize size.
	sizeDigitsCount > 255 ifTrue: [ 
		self error: 'Content is too large!' ].
	aStream 
		<< sizeDigitsCount;
		<< bytesSize asByteArray;
		<< bytes
]

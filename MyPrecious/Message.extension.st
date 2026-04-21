Extension { #name : 'Message' }

{ #category : '*MyPrecious' }
Message >> marshalWith: aMarshaler [
	^aMarshaler marshalMessage: self
]

{ #category : '*MyPrecious' }
Message >> unmarshalWith: aMarshaler [

	^aMarshaler unmarshalMessage: self
]

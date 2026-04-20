Extension { #name : 'ProtoObject' }

{ #category : '*MyPrecious' }
ProtoObject >> isPassByCopy [
	^false
]

{ #category : '*MyPrecious' }
ProtoObject >> isPassByReference [
	^self isPassByCopy not
]

{ #category : '*MyPrecious' }
ProtoObject >> marshalWith: aMarshaler [
	^aMarshaler marshalObject: self
]

{ #category : '*MyPrecious' }
ProtoObject >> unmarshalWith: aMarshaler [
	^aMarshaler unmarshalObject: self
]

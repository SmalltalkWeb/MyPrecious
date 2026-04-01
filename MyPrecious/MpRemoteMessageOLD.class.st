Class {
	#name : 'MpRemoteMessageOLD',
	#superclass : 'Object',
	#instVars : [
		'selector',
		'arguments',
		'receiver'
	],
	#category : 'MyPrecious-Messages-OLD',
	#package : 'MyPrecious',
	#tag : 'Messages-OLD'
}

{ #category : 'accessing' }
MpRemoteMessageOLD >> arguments [
	^ arguments
]

{ #category : 'accessing' }
MpRemoteMessageOLD >> arguments: anObject [
	arguments := anObject
]

{ #category : 'communicating' }
MpRemoteMessageOLD >> deliverBy: transporter [
	self subclassResponsibility
]

{ #category : 'marshalling' }
MpRemoteMessageOLD >> marshalWith: aMarshaller [
	^aMarshaller marshalRemoteMessage: self
]

{ #category : 'printing' }
MpRemoteMessageOLD >> printOn: aStream [
	super printOn: aStream.
	self selector ifNil: [ ^self ].
	aStream
		<< ' #';
		<< self selector
]

{ #category : 'accessing' }
MpRemoteMessageOLD >> receiver [
	^ receiver
]

{ #category : 'accessing' }
MpRemoteMessageOLD >> receiver: anObject [
	receiver := anObject
]

{ #category : 'accessing' }
MpRemoteMessageOLD >> selector [
	^ selector
]

{ #category : 'accessing' }
MpRemoteMessageOLD >> selector: anObject [
	selector := anObject
]

{ #category : 'performing' }
MpRemoteMessageOLD >> send [
	^self receiver
		perform: selector 
		withArguments: arguments
]

{ #category : 'marshalling' }
MpRemoteMessageOLD >> unmarshalWith: aMarshaller [
	^aMarshaller unmarshalRemoteMessage: self
]

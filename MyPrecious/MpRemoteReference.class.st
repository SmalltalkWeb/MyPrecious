Class {
	#name : 'MpRemoteReference',
	#superclass : 'Object',
	#instVars : [
		'id',
		'address'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance' }
MpRemoteReference class >> id: id gateway: aMpGateway [
	^self new
		id: id;
		gateway: aMpGateway;
		yourself
]

{ #category : 'accessing' }
MpRemoteReference >> address [

	^ address
]

{ #category : 'accessing' }
MpRemoteReference >> address: anObject [

	address := anObject
]

{ #category : 'accessing' }
MpRemoteReference >> id [

	^ id
]

{ #category : 'accessing' }
MpRemoteReference >> id: anObject [

	id := anObject
]

{ #category : 'marshaling' }
MpRemoteReference >> unmarshalWith: marshaler [
	^marshaler unmarshalRemoteReference: self
]

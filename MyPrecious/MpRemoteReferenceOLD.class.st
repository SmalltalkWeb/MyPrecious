Class {
	#name : 'MpRemoteReferenceOLD',
	#superclass : 'Object',
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'objectId',
		'address'
	],
	#category : 'MyPrecious-Kernel-OLD',
	#package : 'MyPrecious',
	#tag : 'Kernel-OLD'
}

{ #category : 'instance creation' }
MpRemoteReferenceOLD class >> address: address objectId: id [

	^ super new
		  address: address;
		  objectId: id;
		  yourself
]

{ #category : 'instance creation' }
MpRemoteReferenceOLD class >> new [
	self error: 'Use address:objectId: to create remote reference instances'
]

{ #category : 'accessing' }
MpRemoteReferenceOLD >> address [
	^address
]

{ #category : 'accessing' }
MpRemoteReferenceOLD >> address: anAddress [
	^address := anAddress
]

{ #category : 'marshalling' }
MpRemoteReferenceOLD >> marshalWith: marshaller [
	^marshaller marshalRemoteReference: self
]

{ #category : 'accessing' }
MpRemoteReferenceOLD >> objectId [
	^ objectId
]

{ #category : 'accessing' }
MpRemoteReferenceOLD >> objectId: anObject [
	objectId := anObject
]

{ #category : 'printing' }
MpRemoteReferenceOLD >> printOn: aStream [
	aStream 
		<< 'ID: '
		<< self objectId
]

{ #category : 'marshalling' }
MpRemoteReferenceOLD >> unmarshalWith: marshaller [
	^marshaller unmarshalRemoteReference: self
]

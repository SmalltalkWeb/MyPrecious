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

{ #category : 'instance creation' }
MpRemoteReference class >> id: anId address: anAddress [
	^self new
		id: anId; 
		address: anAddress;
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

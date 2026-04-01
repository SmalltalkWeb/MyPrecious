Class {
	#name : 'MpGateway',
	#superclass : 'Object',
	#instVars : [
		'address'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
MpGateway class >> address: anAddress [
	^self new
		address: anAddress;
		yourself
]

{ #category : 'accessing' }
MpGateway >> address [

	^ address
]

{ #category : 'accessing' }
MpGateway >> address: anObject [

	address := anObject
]

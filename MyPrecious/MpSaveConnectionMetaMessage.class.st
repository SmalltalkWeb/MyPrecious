Class {
	#name : 'MpSaveConnectionMetaMessage',
	#superclass : 'MpMetaMessage',
	#instVars : [
		'otherSideAddress'
	],
	#category : 'MyPrecious-Connected-OLD',
	#package : 'MyPrecious',
	#tag : 'Connected-OLD'
}

{ #category : 'communicating' }
MpSaveConnectionMetaMessage >> deliverBy: postMan [
	postMan deliverSaveConnection: self
	
]

{ #category : 'accessing' }
MpSaveConnectionMetaMessage >> otherSideAddress [
	^ otherSideAddress
]

{ #category : 'accessing' }
MpSaveConnectionMetaMessage >> otherSideAddress: anObject [
	otherSideAddress := anObject
]

Class {
	#name : 'MpLocalAddressOLD2',
	#superclass : 'MpAddressOLD2',
	#instVars : [
		'dispatcher'
	],
	#category : 'MyPrecious-Kernel-OLD2',
	#package : 'MyPrecious',
	#tag : 'Kernel-OLD2'
}

{ #category : 'instance creation' }
MpLocalAddressOLD2 class >> dispatcher: aDispatcher [
	^self new
		dispatcher: aDispatcher;		
		yourself
]

{ #category : 'converting' }
MpLocalAddressOLD2 >> asDispatcher [
	^self dispatcher
]

{ #category : 'accessing' }
MpLocalAddressOLD2 >> dispatcher [

	^ dispatcher
]

{ #category : 'accessing' }
MpLocalAddressOLD2 >> dispatcher: anObject [

	dispatcher := anObject
]

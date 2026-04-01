Class {
	#name : 'MpProxy',
	#superclass : 'ProtoObject',
	#instVars : [
		'dispatcher',
		'targetReference'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
MpProxy class >> reference: aReference dispatcher: aDispatcher [ 
	^self new
		reference: aReference dispatcher: aDispatcher;
		yourself
]

{ #category : 'class membership' }
MpProxy >> class [
	| message |
	message := Message selector: #class.
	^self doesNotUnderstand: message
]

{ #category : 'reflective operations' }
MpProxy >> doesNotUnderstand: aMessage [

	^ dispatcher dispatch: aMessage targetReference: targetReference
]

{ #category : 'initialization' }
MpProxy >> reference: aReference dispatcher: aDispatcher [
	targetReference := aReference.
	dispatcher := aDispatcher
]

{ #category : 'accessing' }
MpProxy >> yourself [
	^self
]

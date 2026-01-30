Class {
	#name : 'MpMock',
	#superclass : 'Object',
	#instVars : [
		'messagesDict'
	],
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'reflective operations' }
MpMock >> doesNotUnderstand: aMessage [
	| actionBlock |
	actionBlock := messagesDict at: aMessage selector ifAbsent: [ ^super doesNotUnderstand: aMessage ].
	^actionBlock valueWithArguments: aMessage arguments 
]

{ #category : 'initialization' }
MpMock >> initialize [ 
	super initialize.
	messagesDict := Dictionary new
]

{ #category : 'initialization' }
MpMock >> selector: sel actionBlock: aBlock [
	messagesDict at: sel put: aBlock 
]

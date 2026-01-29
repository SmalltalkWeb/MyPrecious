Class {
	#name : 'MpProxy',
	#superclass : 'ProtoObject',
	#instVars : [
		'reference',
		'dispatcher'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'initialization' }
MpProxy class >> reference: aReference dispatcher: aDispatcher [ 
	^self new
		reference: aReference dispatcher: aDispatcher;
		yourself
]

{ #category : 'reflective operations' }
MpProxy >> doesNotUnderstand: aMessage [

	^ dispatcher dispatch: aMessage targetReference: reference
]

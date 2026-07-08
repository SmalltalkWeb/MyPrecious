Class {
	#name : 'MpRemoteError',
	#superclass : 'Error',
	#instVars : [
		'exceptionProxy',
		'exceptionClass'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
MpRemoteError class >> on: aProxy class: anExceptionClass messageText: aString [
	^self new
		exceptionProxy: aProxy ;
		exceptionClass: anExceptionClass ;
		messageText: aString ;
		yourself
]

{ #category : 'class membership' }
MpRemoteError >> class [
	exceptionClass ifNil: [ ^super class ].
	^exceptionClass
]

{ #category : 'accessing' }
MpRemoteError >> exceptionClass [

	^ exceptionClass
]

{ #category : 'accessing' }
MpRemoteError >> exceptionClass: anObject [

	exceptionClass := anObject
]

{ #category : 'accessing' }
MpRemoteError >> exceptionProxy [

	^ exceptionProxy 
]

{ #category : 'accessing' }
MpRemoteError >> exceptionProxy: anException [

	exceptionProxy := anException.
	
]

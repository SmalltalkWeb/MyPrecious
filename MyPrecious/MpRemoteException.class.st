Class {
	#name : 'MpRemoteException',
	#superclass : 'Exception',
	#instVars : [
		'exceptionProxy',
		'exceptionClass'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
MpRemoteException class >> on: aProxy class: anExceptionClass messageText: aString [
	^self new
		exceptionProxy: aProxy ;
		exceptionClass: anExceptionClass ;
		messageText: aString ;
		yourself
]

{ #category : 'class membership' }
MpRemoteException >> class [
	exceptionClass ifNil: [ ^super class ].
	^exceptionClass
]

{ #category : 'accessing' }
MpRemoteException >> exceptionClass [

	^ exceptionClass
]

{ #category : 'accessing' }
MpRemoteException >> exceptionClass: anObject [

	exceptionClass := anObject
]

{ #category : 'accessing' }
MpRemoteException >> exceptionProxy [

	^ exceptionProxy 
]

{ #category : 'accessing' }
MpRemoteException >> exceptionProxy: anException [

	exceptionProxy := anException.
	
]

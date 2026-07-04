Class {
	#name : 'MpExceptionResponse',
	#superclass : 'MpResponse',
	#instVars : [
		'exceptionClassName',
		'messageText'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'marshaling' }
MpExceptionResponse >> unmarshalWith: aMarshaler [

	| proxy localExceptionClass |
	proxy := value unmarshalWith: aMarshaler.
	localExceptionClass  := Smalltalk at: exceptionClassName asSymbol.
	value := MpRemoteException
		on: proxy
		class: localExceptionClass
		messageText: messageText 
]

{ #category : 'evaluating' }
MpExceptionResponse >> value [
	self basicValue signal
]

{ #category : 'accessing' }
MpExceptionResponse >> value: anException [
	super value: anException.
	exceptionClassName := anException className.
	messageText := anException messageText 
]

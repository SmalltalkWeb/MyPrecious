Class {
	#name : 'MpMiddlewarePartOLD',
	#superclass : 'Object',
	#instVars : [
		'middleware'
	],
	#category : 'MyPrecious-Kernel-OLD',
	#package : 'MyPrecious',
	#tag : 'Kernel-OLD'
}

{ #category : 'instance creation' }
MpMiddlewarePartOLD class >> middleware: aMiddleware [
	^self new
		middleware: aMiddleware;
		yourself
]

{ #category : 'accessing' }
MpMiddlewarePartOLD >> middleware [
	^ middleware
]

{ #category : 'accessing' }
MpMiddlewarePartOLD >> middleware: anObject [
	middleware := anObject
]

{ #category : 'accessing' }
MpMiddlewarePartOLD >> newId [
	^UUID new asString
]

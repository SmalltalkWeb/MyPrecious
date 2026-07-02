Class {
	#name : 'MpWebMiddlewareTest',
	#superclass : 'MpTcpMiddlewareTestOLD',
	#category : 'MyPreciousNetTests',
	#package : 'MyPreciousNetTests'
}

{ #category : 'tests' }
MpWebMiddlewareTest >> defaultProtocol [
	^MpWebFullAddress http
]

{ #category : 'tests' }
MpWebMiddlewareTest >> middlewareClass [
	^ MpWebMiddleware
]

{ #category : 'tests' }
MpWebMiddlewareTest >> newMiddleware [ 
	^super newMiddleware
		protocol: self defaultProtocol;
		yourself
]

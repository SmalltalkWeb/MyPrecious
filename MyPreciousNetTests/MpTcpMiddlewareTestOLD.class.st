Class {
	#name : 'MpTcpMiddlewareTestOLD',
	#superclass : 'MpReliableConnectedMiddlewareTest',
	#category : 'MyPreciousNetTests',
	#package : 'MyPreciousNetTests'
}

{ #category : 'tests' }
MpTcpMiddlewareTestOLD >> middlewareClass [
	^ MpTcpMiddlewareOLD
]

{ #category : 'tests' }
MpTcpMiddlewareTestOLD >> newMiddleware [ 
	^super newMiddleware
		port: NeTcpUsedPortsTracker freePortAtRandom;
		yourself
]

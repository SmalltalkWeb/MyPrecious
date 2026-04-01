Class {
	#name : 'MpRemoteMessagingTest',
	#superclass : 'TestCase',
	#traits : 'MpTProxyTest',
	#classTraits : 'MpTProxyTest classTrait',
	#instVars : [
		'receiverMiddleware',
		'senderMiddleware'
	],
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'testing' }
MpRemoteMessagingTest class >> isAbstract [ 
	^self == MpRemoteMessagingTest 
]

{ #category : 'running' }
MpRemoteMessagingTest >> assertIsProxy: anObject [
	"MpProxy overrides #class method to answer the receiver's actual class"
	
	| classMethod |
	classMethod := ProtoObject compiledMethodAt: #class.
	self assert: (classMethod valueWithReceiver: anObject) identicalTo: MpProxy	
]

{ #category : 'running' }
MpRemoteMessagingTest >> initMiddleware [ 
	self subclassResponsibility 
]

{ #category : 'running' }
MpRemoteMessagingTest >> setUp [

	| id |
	super setUp.
	self initMiddleware.
	target := MpMock new.
	id := #someIdentifier.
	receiverMiddleware export: target id: id.
	proxy := senderMiddleware proxyAtId: id address: receiverMiddleware address
]

{ #category : 'running' }
MpRemoteMessagingTest >> testArgObjectsProxified [

	self fail: #todo
]

{ #category : 'running' }
MpRemoteMessagingTest >> testOtherObjectResponseProxified [

	| other otherProxy |
	other := MpMock new.
	other selector: #answerAll actionBlock: [ 42 ].
	target selector: #other actionBlock: [ other ].
	otherProxy := proxy other.
	self assertIsProxy: otherProxy.
	self assert: otherProxy answerAll equals: 42
]

{ #category : 'running' }
MpRemoteMessagingTest >> testTargetObjectResponseProxified [

	target selector: #me actionBlock: [target].	
	self assert: proxy me identicalTo: proxy.

]

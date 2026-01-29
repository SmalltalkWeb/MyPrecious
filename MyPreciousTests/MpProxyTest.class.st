Class {
	#name : 'MpProxyTest',
	#superclass : 'TestCase',
	#instVars : [
		'proxy',
		'classFactory',
		'targetClass',
		'target'
	],
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'running' }
MpProxyTest >> setUp [

	| targetReference dispatcher |
	super setUp.
	classFactory := ClassFactoryForTestCase new.
	targetClass := classFactory newClass.
	target := targetClass new.
	targetReference := MpObjectReference new.
	dispatcher := MpLocalDispatcher new.
	dispatcher at: targetReference put: target.
	proxy := MpProxy reference: targetReference dispatcher: dispatcher
]

{ #category : 'running' }
MpProxyTest >> testMessageForwarding [

	targetClass compile: 'someInt
	^42'.
	self assert: proxy someInt equals: 42
]

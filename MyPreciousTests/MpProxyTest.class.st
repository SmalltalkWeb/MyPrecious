Class {
	#name : 'MpProxyTest',
	#superclass : 'TestCase',
	#traits : 'MpTProxyTest',
	#classTraits : 'MpTProxyTest classTrait',
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'running' }
MpProxyTest >> setUp [

	| dispatcher id |
	super setUp.
	target := MpMock new.
	dispatcher := MpLocalDispatcher new.
	id := #someIdentifier.
	dispatcher export: target id: id.
	proxy := MpProxy id: id dispatcher: dispatcher
]

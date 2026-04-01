Class {
	#name : 'MpProxyTestOLD2',
	#superclass : 'TestCase',
	#traits : 'MpTProxyTest',
	#classTraits : 'MpTProxyTest classTrait',
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'running' }
MpProxyTestOLD2 >> setUp [

	| dispatcher id |
	super setUp.
	target := MpMock new.
	dispatcher := MpLocalDispatcherOLD2 new.
	id := #someIdentifier.
	dispatcher export: target id: id.
	proxy := MpProxy id: id dispatcher: dispatcher
]

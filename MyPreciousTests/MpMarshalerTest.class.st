Class {
	#name : 'MpMarshalerTest',
	#superclass : 'TestCase',
	#traits : 'MpTProxyTest',
	#classTraits : 'MpTProxyTest classTrait',
	#instVars : [
		'marshaler'
	],
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'helpers' }
MpMarshalerTest >> export: exportedObject id: id [
	marshaler exporter export: exportedObject id: id
]

{ #category : 'running' }
MpMarshalerTest >> exporter [
	^marshaler exporter
]

{ #category : 'running' }
MpMarshalerTest >> setUp [
	super setUp.
	marshaler := MpMarshaler new.
	marshaler address: MpAddress new
]

{ #category : 'running' }
MpMarshalerTest >> testMarshalManuallyExportedObject [
	| object remoteReference id |
	object := Object new.
	id := #myObject.
	self exporter export: object id: id.
	remoteReference := marshaler marashal: object.
	self assert: remoteReference address identicalTo: marshaler address.
	self assert: remoteReference id identicalTo: id.
	
]

{ #category : 'running' }
MpMarshalerTest >> testMarshalPassByCopyObject [
	| object marshalResult |
	object := 42.
	self assert: object isPassByCopy.
	marshalResult := marshaler marashal: object.
	self assert: marshalResult identicalTo: object
]

{ #category : 'running' }
MpMarshalerTest >> testMarshalPassByReferenceObject [
	| object remoteReference |
	object := Object new.
	self assert: object isPassByReference.
	remoteReference := marshaler marashal: object.
	self assert: remoteReference address identicalTo: marshaler address.
	self deny: remoteReference id isNil.
	
]

{ #category : 'running' }
MpMarshalerTest >> testUnmarshalPassByCopyObject [
	| object unmarshalResult |
	object := 42.
	unmarshalResult := marshaler unmarshal: object.
	self assert: unmarshalResult identicalTo: object
]

{ #category : 'running' }
MpMarshalerTest >> testUnmarshalRemoteReferenceToLocalObject [
	| remoteReference unmarshalledObject exportedObject id |
	exportedObject := Object new.
	id := #myObject.
	self export: exportedObject id: id.
	remoteReference := MpRemoteReference id: id address: marshaler address.
	unmarshalledObject := marshaler unmarshal: remoteReference.
	self assert: unmarshalledObject identicalTo: exportedObject.
	
	
]

{ #category : 'running' }
MpMarshalerTest >> testUnmarshalRemoteReferenceToProxy [
	| remoteReference proxy dispatcher |
	remoteReference := MpRemoteReference id: #someObject address: MpInMemoryAddress new.
	proxy := marshaler unmarshal: remoteReference.
	self assertIsProxy: proxy.
	self assertProxy: proxy hasId: remoteReference id.
	dispatcher := self dispatcherSlotValueInProxy: proxy.
	self assert: dispatcher address equals: remoteReference address.
	self assert: dispatcher marshaler identicalTo: marshaler.
	
	
]

{ #category : 'running' }
MpMarshalerTest >> testUnmarshalRemoteReferenceToProxyTwice [
	| remoteReference proxyA proxyB |
	remoteReference := MpRemoteReference id: #someObject address: MpInMemoryAddress new.
	proxyA := marshaler unmarshal: remoteReference.
	proxyB := marshaler unmarshal: remoteReference.
	self assert: proxyB identicalTo: proxyA	
]

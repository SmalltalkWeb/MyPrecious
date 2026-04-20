Class {
	#name : 'MpMarshalerTest',
	#superclass : 'TestCase',
	#instVars : [
		'marshaler'
	],
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

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
MpMarshalerTest >> testMarshalPassByReferenceObject [
	| object remoteReference |
	object := Object new.
	self assert: object isPassByReference.
	remoteReference := marshaler marashal: object.
	self assert: remoteReference address identicalTo: marshaler address.
	self deny: remoteReference id isNil.
	
]

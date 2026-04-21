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

{ #category : 'asserting' }
MpMarshalerTest >> assertMessage: aMessage selector: selector [

	self assert: aMessage class identicalTo: Message.
	self assert: aMessage selector identicalTo: selector
]

{ #category : 'helpers' }
MpMarshalerTest >> export: anObject id: id [
	^self exporter export: anObject id: id
]

{ #category : 'helpers' }
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
	self export: object id: id.
	remoteReference := marshaler marshal: object.
	self assert: remoteReference address identicalTo: marshaler address.
	self assert: remoteReference id identicalTo: id.
	
]

{ #category : 'running' }
MpMarshalerTest >> testMarshalMessage0Arg [

	| rawMessage marshaledMessage selector |
	selector := #foo.
	rawMessage := Message selector: selector.
	marshaledMessage := marshaler marshal: rawMessage.
	self assertMessage: marshaledMessage selector: selector.
	self assert: marshaledMessage arguments isEmpty
]

{ #category : 'running' }
MpMarshalerTest >> testMarshalMessage1ArgPassByCopyObject [

	| rawMessage marshaledMessage selector arg marshaledArg |
	selector := #bar:.
	arg := 42.
	rawMessage := Message selector: selector argument: arg.
	marshaledMessage := marshaler marshal: rawMessage.
	self assertMessage: marshaledMessage selector: selector.
	marshaledArg := marshaledMessage argument.
	self assert: marshaledArg identicalTo: arg
]

{ #category : 'running' }
MpMarshalerTest >> testMarshalMessage1ArgPassByReferenceObject [

	| rawMessage marshaledMessage selector arg marshaledArg |
	selector := #bar:.
	arg := Object new.
	rawMessage := Message selector: selector argument: arg.
	marshaledMessage := marshaler marshal: rawMessage.
	self assertMessage: marshaledMessage selector: selector.
	marshaledArg := marshaledMessage argument.
	self assert: marshaledArg address identicalTo: marshaler address.
	self deny: marshaledArg id isNil
]

{ #category : 'running' }
MpMarshalerTest >> testMarshalMessage2ArgsPassByCopyObjects [

	| rawMessage marshaledMessage selector args marshaledArgs |
	selector := #foo:bar:.
	args := #( 'hello' 42 ).
	rawMessage := Message selector: selector arguments: args.
	marshaledMessage := marshaler marshal: rawMessage.
	self assertMessage: marshaledMessage selector: selector.
	marshaledArgs := marshaledMessage arguments.
	self assertCollection: marshaledArgs hasSameElements: args
]

{ #category : 'running' }
MpMarshalerTest >> testMarshalMessage2ArgsPassByReferenceObjects [

	| rawMessage marshaledMessage selector args marshaledArgs |
	selector := #foo:bar:.
	args := {
		        Object new.
		        #( 'hello' 42 ) }.
	rawMessage := Message selector: selector arguments: args.
	marshaledMessage := marshaler marshal: rawMessage.
	self assertMessage: marshaledMessage selector: selector.
	marshaledArgs := marshaledMessage arguments.
	marshaledArgs do: [ :each | self assert: each address identicalTo: marshaler address ].
	self deny: marshaledArgs first id equals: marshaledArgs last id
]

{ #category : 'running' }
MpMarshalerTest >> testMarshalPassByCopyObject [
	| object marshalResult |
	object := 42.
	self assert: object isPassByCopy.
	marshalResult := marshaler marshal: object.
	self assert: marshalResult identicalTo: object
]

{ #category : 'running' }
MpMarshalerTest >> testMarshalPassByReferenceObject [
	| object remoteReference |
	object := Object new.
	self assert: object isPassByReference.
	remoteReference := marshaler marshal: object.
	self assert: remoteReference address identicalTo: marshaler address.
	self deny: remoteReference id isNil.
	
]

{ #category : 'running' }
MpMarshalerTest >> testUnmarshalMessage0Arg [

	| rawMessage unmarshaledMessage selector |
	selector := #foo.
	rawMessage := Message selector: selector.
	unmarshaledMessage := marshaler unmarshal: rawMessage.
	self assertMessage: unmarshaledMessage selector: selector.
	self assert: unmarshaledMessage arguments isEmpty
]

{ #category : 'running' }
MpMarshalerTest >> testUnmarshalMessage1ArgPassByCopyObject [

	| rawMessage unmarshaledMessage selector arg marshaledArg |
	selector := #bar:.
	arg := 42.
	rawMessage := Message selector: selector argument: arg.
	unmarshaledMessage := marshaler unmarshal: rawMessage.
	self assertMessage: unmarshaledMessage selector: selector.
	marshaledArg := unmarshaledMessage argument.
	self assert: marshaledArg identicalTo: arg
]

{ #category : 'running' }
MpMarshalerTest >> testUnmarshalMessage1ArgRemoteReferenceToLocalObject [

	| rawMessage unmarshaledMessage selector arg originalArg |
	selector := #bar:.
	originalArg := Object new.
	arg := marshaler marshal: originalArg.
	rawMessage := Message selector: selector argument: arg.
	unmarshaledMessage := marshaler unmarshal: rawMessage.
	self assertMessage: unmarshaledMessage selector: selector.
	self assert: unmarshaledMessage argument identicalTo: originalArg
]

{ #category : 'running' }
MpMarshalerTest >> testUnmarshalMessage1ArgRemoteReferenceToProxy [

	| rawMessage unmarshaledMessage selector remoteReference proxy |
	selector := #bar:.
	remoteReference := MpRemoteReference id: #someObject address: MpInMemoryAddress new.
	rawMessage := Message selector: selector argument: remoteReference.
	unmarshaledMessage := marshaler unmarshal: rawMessage.
	self assertMessage: unmarshaledMessage selector: selector.
	proxy := unmarshaledMessage argument.
	self assertIsProxy: proxy.
	self assertProxy: proxy hasId: remoteReference id.
	self assertProxy: proxy hasAddress: remoteReference address
]

{ #category : 'running' }
MpMarshalerTest >> testUnmarshalMessage2ArgsPassByCopyObjects [

	| rawMessage unmarshaledMessage selector args unmarshaledArgs |
	selector := #foo:bar:.
	args := #( 'hello' 42 ).
	rawMessage := Message selector: selector arguments: args.
	unmarshaledMessage := marshaler unmarshal: rawMessage.
	self assertMessage: unmarshaledMessage selector: selector.
	unmarshaledArgs := unmarshaledMessage arguments.
	self assertCollection: unmarshaledArgs hasSameElements: args
]

{ #category : 'running' }
MpMarshalerTest >> testUnmarshalMessage2ArgsPassByReferenceObjects [

	| rawMessage unmarshaledMessage selector  unmarshaledArgs localObject refOnLocalObject refOnRemoteObject proxy |
	selector := #foo:bar:.
	localObject := Object new.
	refOnLocalObject := marshaler marshal: localObject.
	refOnRemoteObject := MpRemoteReference id: #someObject address: MpInMemoryAddress new.
	rawMessage := Message selector: selector arguments: {refOnLocalObject. refOnRemoteObject}.
	unmarshaledMessage := marshaler unmarshal: rawMessage.
	self assertMessage: unmarshaledMessage selector: selector.
	unmarshaledArgs := unmarshaledMessage arguments.
	self assertCollection: unmarshaledArgs size equals: 2.
	self assert: unmarshaledArgs first identicalTo: localObject.
	proxy := unmarshaledArgs last.
	self assertIsProxy: proxy.
	self assertProxy: proxy hasId: refOnRemoteObject id.
	self assertProxy: proxy hasAddress: refOnRemoteObject address.
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

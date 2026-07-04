Class {
	#name : 'MpUnmarshalingTest',
	#superclass : 'MpMarshalingTest',
	#instVars : [
		'otherMarshaler'
	],
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'running' }
MpUnmarshalingTest >> setUp [
	super setUp.
	otherMarshaler := MpMarshaler new.
	otherMarshaler address: MpInMemoryAddress new
]

{ #category : 'running' }
MpUnmarshalingTest >> testUnmarshalExceptionResponse [

	| originException response marshaledResponse unmarshalledResponse remoteException |
	originException := ZeroDivide dividend: 395.
	response := MpExceptionResponse value: originException.
	marshaledResponse := marshaler marshal: response.
	unmarshalledResponse := otherMarshaler unmarshal: marshaledResponse.
	remoteException := unmarshalledResponse basicValue.
	self assertClassOf: remoteException is: MpRemoteException.
	self assertIsProxy: remoteException exceptionProxy.
	"Remote exception and Proxy both redefine the #class method"
	self assert: remoteException class equals: originException class.
	self assert: remoteException messageText equals: originException messageText
]

{ #category : 'running' }
MpUnmarshalingTest >> testUnmarshalMessage0Arg [

	| rawMessage unmarshaledMessage selector |
	selector := #foo.
	rawMessage := Message selector: selector.
	unmarshaledMessage := otherMarshaler unmarshal: rawMessage.
	self assertMessage: unmarshaledMessage selector: selector.
	self assert: unmarshaledMessage arguments isEmpty
]

{ #category : 'running' }
MpUnmarshalingTest >> testUnmarshalMessage1ArgPassByCopyObject [

	| rawMessage unmarshaledMessage selector arg marshaledArg |
	selector := #bar:.
	arg := 42.
	rawMessage := Message selector: selector argument: arg.
	unmarshaledMessage := otherMarshaler unmarshal: rawMessage.
	self assertMessage: unmarshaledMessage selector: selector.
	marshaledArg := unmarshaledMessage argument.
	self assert: marshaledArg identicalTo: arg
]

{ #category : 'running' }
MpUnmarshalingTest >> testUnmarshalMessage1ArgRemoteReferenceToLocalObject [

	| originalMessage unmarshaledMessage selector originalArg marshaledMessage marshaledArg |
	selector := #bar:.
	originalArg := Object new.
	originalMessage := Message selector: selector argument: originalArg.
	marshaledMessage := marshaler marshal: originalMessage.
	marshaledArg := marshaledMessage argument.
	self assert: marshaledArg address identicalTo: marshaler address.
	unmarshaledMessage := marshaler unmarshal: marshaledMessage.
	self assertMessage: unmarshaledMessage selector: selector.
	self assert: unmarshaledMessage argument identicalTo: originalArg
]

{ #category : 'running' }
MpUnmarshalingTest >> testUnmarshalMessage1ArgRemoteReferenceToProxy [

	| unmarshaledMessage selector proxy originalMessage marshaledMessage remoteReference |
	selector := #bar:.
	originalMessage := Message selector: selector argument: Object new.
	marshaledMessage := marshaler marshal: originalMessage.
	remoteReference := marshaledMessage argument.
	unmarshaledMessage := otherMarshaler unmarshal: marshaledMessage.
	self assertMessage: unmarshaledMessage selector: selector.
	proxy := unmarshaledMessage argument.
	self assertIsProxy: proxy.
	self assertProxy: proxy hasId: remoteReference id.
	self assertProxy: proxy hasAddress: remoteReference address
]

{ #category : 'running' }
MpUnmarshalingTest >> testUnmarshalMessage2ArgsPassByCopyObjects [

	| rawMessage unmarshaledMessage selector args unmarshaledArgs marshaledMessage |
	selector := #foo:bar:.
	args := #( 'hello' 42 ).
	rawMessage := Message selector: selector arguments: args.
	marshaledMessage := marshaler marshal: rawMessage.
	unmarshaledMessage := otherMarshaler unmarshal: marshaledMessage.
	self assertMessage: unmarshaledMessage selector: selector.
	unmarshaledArgs := unmarshaledMessage arguments.
	self assertCollection: unmarshaledArgs hasSameElements: args
]

{ #category : 'running' }
MpUnmarshalingTest >> testUnmarshalMessage2ArgsPassByReferenceObjects [

	| rawMessage unmarshaledMessage selector  unmarshaledArgs localObject refOnLocalObject refOnRemoteObject proxy |
	selector := #foo:bar:.
	localObject := Object new.
	refOnLocalObject := otherMarshaler marshal: localObject.
	refOnRemoteObject := marshaler marshal: Object new.
	rawMessage := Message selector: selector arguments: {refOnLocalObject. refOnRemoteObject}.
	unmarshaledMessage := otherMarshaler unmarshal: rawMessage.
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
MpUnmarshalingTest >> testUnmarshalNormalResponsePassByCopyValue [
	| response marshaledResponse value unmarshalledResponse |
	value := 256.
	response := MpNormalResponse value: value.
	marshaledResponse := marshaler marshal: response.
	unmarshalledResponse := otherMarshaler unmarshal: marshaledResponse.
	self assert: unmarshalledResponse basicValue identicalTo: value.
	
]

{ #category : 'running' }
MpUnmarshalingTest >> testUnmarshalNormalResponsePassByReferenceValue [
	| response marshaledResponse unmarshalledResponse |
	response := MpNormalResponse value: Object new.
	marshaledResponse := marshaler marshal: response.
	unmarshalledResponse := otherMarshaler unmarshal: marshaledResponse.
	self assertIsProxy: unmarshalledResponse basicValue .
	
]

{ #category : 'running' }
MpUnmarshalingTest >> testUnmarshalPassByCopyObject [
	| object unmarshalResult |
	object := 42.
	unmarshalResult := otherMarshaler unmarshal: object.
	self assert: unmarshalResult identicalTo: object
]

{ #category : 'running' }
MpUnmarshalingTest >> testUnmarshalRemoteReferenceToLocalObject [

	| remoteReferenceFromObject unmarshalledObject exportedObject proxy remoteReferenceFromProxy |
	exportedObject := Object new.
	remoteReferenceFromObject := marshaler marshal: exportedObject.
	proxy := otherMarshaler unmarshal: remoteReferenceFromObject.
	self assertIsProxy: proxy.
	remoteReferenceFromProxy := otherMarshaler marshal: proxy.
	unmarshalledObject := marshaler unmarshal: remoteReferenceFromProxy.
	self assert: unmarshalledObject identicalTo: exportedObject
]

{ #category : 'running' }
MpUnmarshalingTest >> testUnmarshalRemoteReferenceToProxy [
	| remoteReference proxy dispatcher |
	remoteReference := marshaler marshal: Object new.
	proxy := otherMarshaler unmarshal: remoteReference.
	self assertIsProxy: proxy.
	self assertProxy: proxy hasId: remoteReference id.
	dispatcher := self dispatcherSlotValueInProxy: proxy.
	self assert: dispatcher address equals: remoteReference address.
	self denyIsProxy: dispatcher marshaler.
	self assert: dispatcher marshaler identicalTo: otherMarshaler.
	
]

{ #category : 'running' }
MpUnmarshalingTest >> testUnmarshalRemoteReferenceToProxyTwice [

	| remoteReference proxyA proxyB |
	remoteReference := marshaler marshal: Object new.
	proxyA := otherMarshaler unmarshal: remoteReference.
	proxyB := otherMarshaler unmarshal: remoteReference.
	self assert: proxyB identicalTo: proxyA
]

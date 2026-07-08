Class {
	#name : 'MpMarshalingTest',
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
MpMarshalingTest >> assertMessage: aMessage selector: selector [

	self assert: aMessage class identicalTo: Message.
	self assert: aMessage selector identicalTo: selector
]

{ #category : 'helpers' }
MpMarshalingTest >> export: anObject id: id [
	^self exporter export: anObject id: id
]

{ #category : 'helpers' }
MpMarshalingTest >> exporter [
	^marshaler exporter
]

{ #category : 'running' }
MpMarshalingTest >> newAddress [
	"We provide target dispatcher to ensure different addresses are NOT equal.
	Address equality is used to retrieve local objects. See MpMarshaler >> #unmarshalRemoteReference:"

	^ MpInMemoryAddress receiver: MpInMemoryReceiver new
]

{ #category : 'running' }
MpMarshalingTest >> setUp [

	super setUp.
	marshaler := MpMarshaler new.
	marshaler address: self newAddress
]

{ #category : 'running' }
MpMarshalingTest >> testMarshalExceptionResponse [
	| originException response marshaledResponse remoteReference |
	originException := ZeroDivide dividend: 395.
	response := MpExceptionResponse value: originException.
	marshaledResponse := marshaler marshal: response.
	remoteReference := marshaledResponse basicValue.
	self assert: remoteReference address identicalTo: marshaler address.
	
]

{ #category : 'running' }
MpMarshalingTest >> testMarshalManuallyExportedObject [
	| object remoteReference id |
	object := Object new.
	id := #myObject.
	self export: object id: id.
	remoteReference := marshaler marshal: object.
	self assert: remoteReference address identicalTo: marshaler address.
	self assert: remoteReference id identicalTo: id.
	
]

{ #category : 'running' }
MpMarshalingTest >> testMarshalMessage0Arg [

	| rawMessage marshaledMessage selector |
	selector := #foo.
	rawMessage := Message selector: selector.
	marshaledMessage := marshaler marshal: rawMessage.
	self assertMessage: marshaledMessage selector: selector.
	self assert: marshaledMessage arguments isEmpty
]

{ #category : 'running' }
MpMarshalingTest >> testMarshalMessage1ArgPassByCopyObject [

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
MpMarshalingTest >> testMarshalMessage1ArgPassByReferenceObject [

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
MpMarshalingTest >> testMarshalMessage2ArgsPassByCopyObjects [

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
MpMarshalingTest >> testMarshalMessage2ArgsPassByReferenceObjects [

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
MpMarshalingTest >> testMarshalNormalResponsePassByCopyValue [
	| response marshaledResponse value |
	value := 256.
	response := MpNormalResponse value: value.
	marshaledResponse := marshaler marshal: response.
	self assert: marshaledResponse basicValue identicalTo: value.
	
]

{ #category : 'running' }
MpMarshalingTest >> testMarshalNormalResponsePassByReferenceValue [
	| response marshaledResponse remoteReference |
	response := MpNormalResponse value: Object new.
	marshaledResponse := marshaler marshal: response.
	remoteReference := marshaledResponse basicValue.
	self assert: remoteReference address identicalTo: marshaler address.
	
]

{ #category : 'running' }
MpMarshalingTest >> testMarshalPassByCopyObject [
	| object marshalResult |
	object := 42.
	self assert: object isPassByCopy.
	marshalResult := marshaler marshal: object.
	self assert: marshalResult identicalTo: object
]

{ #category : 'running' }
MpMarshalingTest >> testMarshalPassByReferenceObject [
	| object remoteReference |
	object := Object new.
	self assert: object isPassByReference.
	remoteReference := marshaler marshal: object.
	self assert: remoteReference address identicalTo: marshaler address.
	self deny: remoteReference id isNil.
	
]

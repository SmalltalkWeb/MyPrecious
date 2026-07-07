"
Placeholder for remote object
"
Class {
	#name : 'MpProxy',
	#superclass : 'ProtoObject',
	#instVars : [
		'id',
		'sender'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
MpProxy class >> id: anId sender: aDispatcher [
	^self new
		id: anId sender: aDispatcher;
		yourself
]

{ #category : 'class membership' }
MpProxy >> class [
	| message |
	message := Message selector: #class.
	^self doesNotUnderstand: message
]

{ #category : 'reflective operations' }
MpProxy >> doesNotUnderstand: aMessage [
	"Value the response to get the actual value or signal an exception.
	See the MpResponse hierarchy"
	| remoteResponse |
	remoteResponse := sender send: aMessage targetId: id.
	^ remoteResponse value
]

{ #category : 'initialization' }
MpProxy >> id: anId sender: aSender [
	id := anId.
	sender := aSender
]

{ #category : 'marshaling' }
MpProxy >> marshalWith: marshaler [
	^marshaler marshalProxyId: id dispatcher: sender 
]

{ #category : 'accessing' }
MpProxy >> yourself [
	^self
]

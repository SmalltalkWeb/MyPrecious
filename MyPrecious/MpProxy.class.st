"
Placeholder for remote object
"
Class {
	#name : 'MpProxy',
	#superclass : 'ProtoObject',
	#instVars : [
		'dispatcher',
		'id'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
MpProxy class >> id: anId dispatcher: aDispatcher [
	^self new
		id: anId dispatcher: aDispatcher;
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

	| remoteResponse |
	remoteResponse := dispatcher dispatch: aMessage targetId: id.
	^ remoteResponse value
]

{ #category : 'initialization' }
MpProxy >> id: anId dispatcher: aDispatcher [
	id := anId.
	dispatcher := aDispatcher
]

{ #category : 'marshaling' }
MpProxy >> marshalWith: marshaler [
	^marshaler marshalProxyId: id dispatcher: dispatcher 
]

{ #category : 'accessing' }
MpProxy >> yourself [
	^self
]

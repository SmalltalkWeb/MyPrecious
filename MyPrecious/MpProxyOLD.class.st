Class {
	#name : 'MpProxyOLD',
	#superclass : 'ProtoObject',
	#instVars : [
		'remoteReference',
		'isDebugging',
		'transporter'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
MpProxyOLD class >> transporter: aTransporter remoteReference: aRemoteReference [
	^ self new
		transporter: aTransporter remoteReference: aRemoteReference;
		yourself
]

{ #category : 'class membership' }
MpProxyOLD >> basicClass [
	| message |
	isDebugging ifTrue: [ ^ super class ]. "Make it possible to debug + avoid infinite debuggers"
	message := Message selector: #class.
	^ self doesNotUnderstand: message
]

{ #category : 'class membership' }
MpProxyOLD >> basicSpecies [

	^ self basicClass 
]

{ #category : 'class membership' }
MpProxyOLD >> class [

	isDebugging ifTrue: [ ^ super class ]. "Make it possible to debug + avoid infinite debuggers"
	^ Smalltalk at: self className ifAbsent: [ self basicClass ]
]

{ #category : 'class membership' }
MpProxyOLD >> className [

	| message |
	message := Message selector: #className.
	^ (self doesNotUnderstand: message) asSymbol
]

{ #category : 'reflective operations' }
MpProxyOLD >> doesNotUnderstand: aMessage [

	| result |
	result := [ 
	          transporter
		          send: aMessage selector
		          arguments: aMessage arguments
		          to: remoteReference ]
		          on: Error
		          do: [ :ex | 
			          isDebugging := true.
			          ex pass ].
	isDebugging := false.
	^ result
]

{ #category : 'initialize-release' }
MpProxyOLD >> initialize [
	super initialize.
	isDebugging := false.
]

{ #category : 'class membership' }
MpProxyOLD >> isKindOf: aClass [

	"Answer whether the class, aClass, is a superclass or class of the receiver.
	The current implemementation allows for a Trait to be used as argument"

	^ self class == aClass or: [ self class inheritsFrom: aClass ]
]

{ #category : 'printing' }
MpProxyOLD >> longPrintOn: aStream limitedTo: sizeLimit indent: indent [
	| message |
	isDebugging ifTrue: [ ^'Proxy on Remote Object' ].
	message := Message selector: #longPrintOn:limitedTo:indent: arguments: {aStream. sizeLimit. indent}.
	^ self doesNotUnderstand: message		
]

{ #category : 'marshalling' }
MpProxyOLD >> marshalWith: marshaller [
	^marshaller marshalRemoteReference: remoteReference
]

{ #category : 'printing' }
MpProxyOLD >> printStringLimitedTo: limit [
	| message |
	isDebugging ifTrue: [^'Proxy on Remote Object']. "Make it possible to debug + avoid infinite debuggers"
	message := Message selector: #printStringLimitedTo: argument: limit.
	^ self doesNotUnderstand: message	
]

{ #category : 'class membership' }
MpProxyOLD >> species [

	isDebugging ifTrue: [ ^ super class ]. "Make it possible to debug + avoid infinite debuggers"
	^ Smalltalk at: self speciesName ifAbsent: [ self basicSpecies ]
]

{ #category : 'class membership' }
MpProxyOLD >> speciesName [

	| message species |
	message := Message selector: #species.
	species := self doesNotUnderstand: message.
	^species name asSymbol
]

{ #category : 'printing' }
MpProxyOLD >> stDisplayString [
	| message |
	isDebugging ifTrue: [ ^ 'Proxy on Remote Object' ]. "Make it possible to debug + avoid infinite debuggers"
	message := Message selector: #stDisplayString.
	^ self doesNotUnderstand: message
	
]

{ #category : 'initialize-release' }
MpProxyOLD >> transporter: aTransporter remoteReference: aRemoteReference [
	remoteReference := aRemoteReference. 
	transporter := aTransporter.
]

{ #category : 'accessing' }
MpProxyOLD >> yourself [
	^self
]

Class {
	#name : 'MpTcpDemo',
	#superclass : 'Object',
	#classInstVars : [
		'middleware'
	],
	#category : 'MyPrecious-Demo',
	#package : 'MyPrecious',
	#tag : 'Demo'
}

{ #category : '1-start' }
MpTcpDemo class >> receiverPort [

	^ 44444
]

{ #category : '1-start' }
MpTcpDemo class >> senderPort [

	^ 55555
]

{ #category : '1-initializing' }
MpTcpDemo class >> startMiddleware: port [
	middleware ifNotNil: [ middleware stop ].
	middleware := MpTcpMiddleware new.
	middleware port: port.
	middleware start
]

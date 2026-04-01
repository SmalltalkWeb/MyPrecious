Class {
	#name : 'MpMarshaller',
	#superclass : 'Object',
	#instVars : [
		'exporter'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
MpMarshaller >> exporter [

	^ exporter
]

{ #category : 'accessing' }
MpMarshaller >> exporter: anObject [

	exporter := anObject
]

{ #category : 'initialization' }
MpMarshaller >> initialize [ 
	super initialize.
	self exporter: MpExporter new
]

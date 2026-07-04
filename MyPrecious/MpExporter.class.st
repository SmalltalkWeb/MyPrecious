Class {
	#name : 'MpExporter',
	#superclass : 'Object',
	#instVars : [
		'idToObjectDict'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'exporting' }
MpExporter >> export: anObject id: id [ 
	idToObjectDict at: id put: anObject 
]

{ #category : 'accessing' }
MpExporter >> idAt: anObject [
	^idToObjectDict keyAtValue: anObject ifAbsent: [ self idAtNewExport: anObject ]
]

{ #category : 'exporting' }
MpExporter >> idAtNewExport: anObject [
	| newId |
	newId := self newFreeId.
	self export: anObject id: newId.
	^newId
]

{ #category : 'initialization' }
MpExporter >> initialize [ 
	super initialize.
	idToObjectDict := Dictionary new
]

{ #category : 'exporting' }
MpExporter >> newFreeId [

	^ MpIdGenerator newId
]

{ #category : 'accessing' }
MpExporter >> objectAt: id [
	^idToObjectDict at: id
]

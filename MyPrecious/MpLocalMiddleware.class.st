Class {
	#name : 'MpLocalMiddleware',
	#superclass : 'MpMiddleware',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'exporting' }
MpLocalMiddleware >> export: anObjectToExport id: anId [

	localDispatcher export: anObjectToExport id: anId

]

{ #category : 'accessing' }
MpLocalMiddleware >> localDispatcher [

	^ localDispatcher
]

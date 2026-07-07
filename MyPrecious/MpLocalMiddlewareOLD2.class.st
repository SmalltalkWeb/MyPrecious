Class {
	#name : 'MpLocalMiddlewareOLD2',
	#superclass : 'MpMiddlewareOLD2',
	#category : 'MyPrecious-Kernel-OLD2',
	#package : 'MyPrecious',
	#tag : 'Kernel-OLD2'
}

{ #category : 'exporting' }
MpLocalMiddlewareOLD2 >> export: anObjectToExport id: anId [

	localDispatcher export: anObjectToExport id: anId

]

{ #category : 'accessing' }
MpLocalMiddlewareOLD2 >> receiver [

	^ localDispatcher
]

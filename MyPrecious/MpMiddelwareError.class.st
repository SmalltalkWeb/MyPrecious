Class {
	#name : 'MpMiddelwareError',
	#superclass : 'Error',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'handling' }
MpMiddelwareError >> defaultAction [

	UIManager default inform: self description
]

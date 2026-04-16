"
Serializes and marshalls messages before passing them to the target's remote reference.
Then deserializes and umarshalls responses before returning them.
"
Class {
	#name : 'MpRemoteDispatcher',
	#superclass : 'MpDispatcher',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'dispatching' }
MpRemoteDispatcher >> dispatch: aMessage targetReference: aReference [
	^aReference dispatch: aMessage
]

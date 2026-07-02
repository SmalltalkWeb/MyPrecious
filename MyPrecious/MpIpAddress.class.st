Class {
	#name : 'MpIpAddress',
	#superclass : 'MpAddress',
	#instVars : [
		'ip',
		'port'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
MpIpAddress class >> ip: ip port: port [
	^self new
		ip: ip;
		port: port;
		yourself
]

{ #category : 'accessing' }
MpIpAddress >> ip [
	^ ip
]

{ #category : 'accessing' }
MpIpAddress >> ip: anObject [
	ip := anObject
]

{ #category : 'accessing' }
MpIpAddress >> port [
	^ port
]

{ #category : 'accessing' }
MpIpAddress >> port: anObject [
	port := anObject
]

{ #category : 'printing' }
MpIpAddress >> printOn: aStream [
	aStream
		<< 'IP: ';
		print: self ip;
		<< ' - Port: ';
		print: self port
]

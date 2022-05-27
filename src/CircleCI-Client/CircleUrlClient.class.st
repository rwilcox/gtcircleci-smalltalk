Class {
	#name : #CircleUrlClient,
	#superclass : #Object,
	#instVars : [
		'clientToken',
		'znclient'
	],
	#category : #'CircleCI-Client'
}

{ #category : #accessing }
CircleUrlClient >> clientToken [

	^ clientToken
]

{ #category : #accessing }
CircleUrlClient >> clientToken: anObject [

	clientToken := anObject.
	
   znclient := ZnClient new.
]

{ #category : #accessing }
CircleUrlClient >> getProject: slug [
  |project|
  self setupAuth.

  project := CircleProject new.
  project client: self.
  project projectSlug: slug.
  ^ project.
 
 
]

{ #category : #'as yet unclassified' }
CircleUrlClient >> setupAuth [
	znclient request headers at: 'Circle-Token' put: clientToken.
]

{ #category : #accessing }
CircleUrlClient >> znclient [

	^ znclient
]

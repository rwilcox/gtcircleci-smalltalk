Class {
	#name : #CirclePipelineModelBuilder,
	#superclass : #Object,
	#instVars : [
		'clientToken',
		'znclient'
	],
	#category : #'CircleCI-Client'
}

{ #category : #'as yet unclassified' }
CirclePipelineModelBuilder >> pipelinesFromJson: jsonStr withClient: client objectParent: parent [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	

  |output resultsObj|

  resultsObj := NeoJSONReader fromString: jsonStr.
  output := OrderedCollection new.
  "^ (resultsObj at: 'items')."
  ^ (resultsObj at: 'items') collect: [ :each ||o actor|
	 actor := (each at: 'trigger' at: 'actor').
	 o := CirclePipeline new.
	 o id: (each at: 'id');
	startedBy: (actor at: 'login');
	 state: (each at: 'state');
	 number: (each at: 'number');
	 client: client;
	 originalJson: each;
	 parent: parent;
	 projectSlug: (each at: 'project_slug').
  ].
  

  

]

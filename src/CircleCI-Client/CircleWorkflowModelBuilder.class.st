Class {
	#name : #CircleWorkflowModelBuilder,
	#superclass : #Object,
	#category : #'CircleCI-Client'
}

{ #category : #'as yet unclassified' }
CircleWorkflowModelBuilder >> workflowsFromJson: jsonStr withClient: client objectParent: parent [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|resultsObj|
	
	resultsObj := NeoJSONReader fromString: jsonStr.
	
	^ (resultsObj at: 'items') collect: [  :each ||o|
		o := CircleWorkflow new.
		o name: (each at: 'name');
		createdAt: (each at: 'created_at');
		id: (each at: 'id');
		originalJson: each;
		parent: parent;
		status: (each at: 'status').
	].
]

Class {
	#name : #CirclePipeline,
	#superclass : #CircleModelElement,
	#instVars : [
		'state',
		'number',
		'projectSlug',
		'id',
		'startedBy',
		'client',
		'originalJson',
		'parent'
	],
	#category : #'CircleCI-Client'
}

{ #category : #accessing }
CirclePipeline >> client [

	^ client
]

{ #category : #accessing }
CirclePipeline >> client: anObject [

	client := anObject
]

{ #category : #'as yet unclassified' }
CirclePipeline >> getWorkflows [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|workflowInfoStr modelBuilder|
	
   workflowInfoStr := client znclient get: 'https://circleci.com/api/v2/pipeline/', id, '/workflow'.
   modelBuilder := CircleWorkflowModelBuilder new.  
  ^ modelBuilder workflowsFromJson: workflowInfoStr withClient: client objectParent: self.

]

{ #category : #accessing }
CirclePipeline >> gtDisplayOn:  stream [
	^ stream nextPutAll: (startedBy, ' ', state, ' ', projectSlug).
]

{ #category : #'as yet unclassified' }
CirclePipeline >> gtInspectorVariableNodesIn: aCollection [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	aCollection add: (GTInspectorDynamicNode hostObject: self label: 'state' value: state).
	aCollection add: (GTInspectorDynamicNode hostObject: self label: 'started by' value: startedBy).
	aCollection add: (GTInspectorDynamicNode hostObject: self label: 'workflows' value: (self getWorkflows)).
]

{ #category : #accessing }
CirclePipeline >> id [

	^ id
]

{ #category : #accessing }
CirclePipeline >> id: anObject [

	id := anObject
]

{ #category : #accessing }
CirclePipeline >> number [

	^ number
]

{ #category : #accessing }
CirclePipeline >> number: anObject [

	number := anObject
]

{ #category : #accessing }
CirclePipeline >> originalJson [

	^ originalJson
]

{ #category : #accessing }
CirclePipeline >> originalJson: anObject [

	originalJson := anObject
]

{ #category : #accessing }
CirclePipeline >> parent [

	^ parent
]

{ #category : #accessing }
CirclePipeline >> parent: anObject [

	parent := anObject
]

{ #category : #accessing }
CirclePipeline >> projectSlug [

	^ projectSlug
]

{ #category : #accessing }
CirclePipeline >> projectSlug: anObject [

	projectSlug := anObject
]

{ #category : #'as yet unclassified' }
CirclePipeline >> responseDebugView: aView [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	<gtView>

	^ aView textEditor
		title: 'Original Response';
		priority: 110;
		aptitude: BrGlamorousCodeEditorAptitude;
		text: [ self originalJson  asRopedText ]
]

{ #category : #accessing }
CirclePipeline >> startedBy [

	^ startedBy
]

{ #category : #accessing }
CirclePipeline >> startedBy: anObject [

	startedBy := anObject
]

{ #category : #accessing }
CirclePipeline >> state [

	^ state
]

{ #category : #accessing }
CirclePipeline >> state: anObject [

	state := anObject
]

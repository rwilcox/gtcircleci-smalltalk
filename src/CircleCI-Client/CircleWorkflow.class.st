Class {
	#name : #CircleWorkflow,
	#superclass : #CircleModelElement,
	#instVars : [
		'name',
		'status',
		'parent',
		'createdAt',
		'id',
		'originalJson'
	],
	#category : #'CircleCI-Client'
}

{ #category : #accessing }
CircleWorkflow >> createdAt [

	^ createdAt
]

{ #category : #accessing }
CircleWorkflow >> createdAt: anObject [

	createdAt := anObject
]

{ #category : #printing }
CircleWorkflow >> gtDisplayOn: stream [
  ^ stream nextPutAll: (name, ' ', status, ' by ', ((self parent) startedBy), ' at ', createdAt).
]

{ #category : #accessing }
CircleWorkflow >> id [

	^ id
]

{ #category : #accessing }
CircleWorkflow >> id: anObject [

	id := anObject
]

{ #category : #accessing }
CircleWorkflow >> name [

	^ name
]

{ #category : #accessing }
CircleWorkflow >> name: anObject [

	name := anObject
]

{ #category : #accessing }
CircleWorkflow >> originalJson [

	^ originalJson
]

{ #category : #accessing }
CircleWorkflow >> originalJson: anObject [

	originalJson := anObject
]

{ #category : #accessing }
CircleWorkflow >> parent [

	^ parent
]

{ #category : #accessing }
CircleWorkflow >> parent: anObject [

	parent := anObject
]

{ #category : #'as yet unclassified' }
CircleWorkflow >> responseDebugView: aView [
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
CircleWorkflow >> status [

	^ status
]

{ #category : #accessing }
CircleWorkflow >> status: anObject [

	status := anObject
]

{ #category : #'as yet unclassified' }
CircleWorkflow >> workflowView: aView [

  <gtView>
	^ aView explicit
	  title: 'Workflow';
	  stencil: [ |actionCard btn outer statusLabel workflowNameLabel| 
		outer := BlElement new.
		outer layout: BlLinearLayout new beVertical .
		outer size: 500@500.
		
		btn := BrButton new 
				aptitude: BrGlamorousButtonWithLabelAptitude ;
				label: 'Open In Browser';
				action: [ WebBrowser openOn: ('https://app.circleci.com/pipelines/workflows/', (self id)) ].
		outer addChild: btn.
		statusLabel  := BlTextElement new.
		statusLabel  text: ('Status: ', (self status)) asRopedText.
		
		workflowNameLabel := BlTextElement new.
		workflowNameLabel text: ((self name) asRopedText).
		outer addChild: statusLabel .
		outer addChild: workflowNameLabel .
		outer.
		]. 
]

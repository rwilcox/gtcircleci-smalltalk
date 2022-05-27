Class {
	#name : #CircleProject,
	#superclass : #CircleModelElement,
	#instVars : [
		'projectSlug',
		'client'
	],
	#category : #'CircleCI-Client'
}

{ #category : #accessing }
CircleProject >> client [

	^ client
]

{ #category : #accessing }
CircleProject >> client: anObject [

	client := anObject
]

{ #category : #resolving }
CircleProject >> get [
  |projectInfo|
	 projectInfo := client znclient get: 'https://circleci.com/api/v2/project/' , projectSlug .

  ^ (NeoJSONReader fromString: projectInfo).
]

{ #category : #resolving }
CircleProject >> getPipelines [
  |projectInfoStr modelBuilder|
	 projectInfoStr := client znclient get: 'https://circleci.com/api/v2/project/' , projectSlug, '/pipeline' .

  modelBuilder := CirclePipelineModelBuilder new.  
  ^ modelBuilder pipelinesFromJson: projectInfoStr withClient: client objectParent: self.
]

{ #category : #accessing }
CircleProject >> projectSlug [

	^ projectSlug
]

{ #category : #accessing }
CircleProject >> projectSlug: anObject [

	projectSlug := anObject
]

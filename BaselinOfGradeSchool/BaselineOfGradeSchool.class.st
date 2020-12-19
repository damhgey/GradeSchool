Class {
	#name : #BaselineOfGradeSchool,
	#superclass : #BaselineOf,
	#category : #BaselinOfGradeSchool
}

{ #category : #baselines }
BaselineOfGradeSchool >> baseline: spec [
	<baseline>
	
	spec for: #common do: [
					
					spec package: 'GradeSchool'.
					spec package: 'GradeSchool-Tests' with: [ spec requires: #('GradeSchool') ].
		]
]

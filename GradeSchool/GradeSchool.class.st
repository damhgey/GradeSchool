Class {
	#name : #GradeSchool,
	#superclass : #Object,
	#instVars : [
		'students'
	],
	#category : #GradeSchool
}

{ #category : #adding }
GradeSchool >> addSt: name inGrade: grade [

		students  
		at: grade 
		ifPresent: [ :rank | rank add: name  ]
		ifAbsentPut: [ SortedCollection   new
				add: name ;
				yourself ]
]

{ #category : #adding }
GradeSchool >> addStudents: aCollection [

	"Add a collection of students and their grade in the school.
	The collection must follow the example : #(#('Blair' 2) #('James' 2) #('Paul' 2))"
	aCollection
		do: [ :student | self addSt: student first inGrade: student last ]

]

{ #category : #adding }
GradeSchool >> atGrade: integer [ 

	"Awnser a sorted list of students having specified grade"

	^ students at:integer   ifPresent: #asArray ifAbsent: [ #() ]
]

{ #category : #adding }
GradeSchool >> initialize [ 
	students := Dictionary new
]

{ #category : #adding }
GradeSchool >> roster [

	^(students  keys  sorted collect: [ :key | students  at: key ]) flattened.

	

]

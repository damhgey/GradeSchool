"
A GradeSchoolTest is a test class for testing the behavior of GradeSchool
"
Class {
	#name : #GradeSchoolTest,
	#superclass : #TestCase,
	#instVars : [
		'gradeSchoolCalculator'
	],
	#category : #'GradeSchool-Tests'
}

{ #category : #running }
GradeSchoolTest >> setUp [ 
	super setUp.
	gradeSchoolCalculator := GradeSchool new
]

{ #category : #tests }
GradeSchoolTest >> test01_AddingAStudentAddsThemToTheSortedRoster [ 
	| result |

	result := gradeSchoolCalculator
		addStudents: #(#('Aimee' 2));
		roster.
		
	self assert: result equals:   #('Aimee' )
]

{ #category : #tests }
GradeSchoolTest >> test02_AddingMoreStudentAddsThemToTheSortedRoster [ 
	| result |

	result := gradeSchoolCalculator
		addStudents: #(#('Blair' 2) #('James' 2) #('Paul' 2));
		roster.
		
	self assert: result equals: #('Blair' 'James' 'Paul')
]

{ #category : #tests }
GradeSchoolTest >> test03_AddingStudentsToDifferentGradesAddsThemToTheSameSortedRoster [ 
	| result |

	result := gradeSchoolCalculator
		addStudents: #(#('Chelsea' 3) #('Logan' 7));
		roster.
		
	self assert: result equals: #('Chelsea' 'Logan')
]

{ #category : #tests }
GradeSchoolTest >> test04_RosterReturnsAnEmptyListIfThereAreNoStudentsEnrolled [ 
	| result |

	result := gradeSchoolCalculator
		addStudents: #();
		roster.
		
	self assert: result equals: #()
]

{ #category : #tests }
GradeSchoolTest >> test05_StudentNamesWithGradesAreDisplayedInTheSameSortedRoster [ 
	| result |

	result := gradeSchoolCalculator
		addStudents:
			#(#('Peter' 2) #('Anna' 1) #('Barb' 1) #('Zoe' 2) #('Alex' 2) #('Jim' 3) #('Charlie' 1));
		roster.
		
	self
		assert: result
		equals: #('Anna' 'Barb' 'Charlie' 'Alex' 'Peter' 'Zoe' 'Jim')

]

{ #category : #tests }
GradeSchoolTest >> test06_GradeReturnsTheStudentsInThatGradeInAlphabeticalOrder [ 
	| result |

	result := gradeSchoolCalculator addStudents: #(#('Franklin' 5 ) #('Bradley' 5 ) #('Jeff' 1 ) ); atGrade: 5.
	self assert: result equals: #('Bradley' 'Franklin' )
]

{ #category : #tests }
GradeSchoolTest >> test07_GradeReturnsAnEmptyListIfThereAreNoStudentsInThatGrade [ 
	| result |

	result := gradeSchoolCalculator
		addStudents: #();
		atGrade: 1.
		
	self assert: result equals: #()
]

{ #category : #tests }
GradeSchoolTest >> test100_EnsureDataIsImmutable [ 
	| result |

	result := gradeSchoolCalculator
		addStudents: #(#('Chelsea' 3) #('Logan' 7));
		yourself.
		
	result roster at: 1 put: 'Not Chelsea'.
		
	self assert: result roster equals: #('Chelsea' 'Logan')

]

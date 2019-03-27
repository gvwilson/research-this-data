# Data for "Research This!"

Ths repository holds data used in the paper "Research This! Questions that Computing Educators Most Want Computing Education Researchers to Answer" by Denny, Becker, Craig, Wilson, and Banaszkiewicz.  This material is made available under the Creative Commons Attribution-ShareAlike license: please see LICENSE.md for details.

## raw-questions.csv

- Extracted 2018-11-02 from database.
- Contains raw questions with IDs and manual categorizations.
- Fields:
  - ID: unique raw question identifier
  - ParticipantID: who submitted this question
  - QuestionID: original raw question ID (disregard)
  - Category (BB): categorization by Brett Becker
  - Category (MC): categorization by Michelle Craig
  - Category (GW): categorization by Greg Wilson
  - Category (PD): categorization by Paul Denny
  - Categories: one or more categories (separated by ';')
  - UnifiedQuestion: text of question this maps to (possibly duplicated)
  - RawQuestion: original question submitted by respondent
  - Why: why they want to know
  - What: what they'll do with the information

## final-questions.csv

- Constructed manually 2018-11-02.
- Contains final questions with IDs and categorizations.
- Fields:
  - ID: unique question identifier (1-1 with question ID in 'question.csv' below)
  - Category: category of question
  - Question: text of question
  - Includes: IDs of questions from raw-questions.csv mapped to this question (separated by ';')

## category.csv

- Extracted programmatically 2018-11-02.
- Contains question categories.
- Fields:
  - id: unique category ID
  - name: category name

## person.csv

- Extracted programmatically 2018-11-02.
- Contains information about persons who ranked questions.
- Fields:
  - id: unique person ID
  - hash_id: hashed ID to connect to contact information (not shared)
  - last_updated_at: when record was last modified
  - stage: stage of question answering process reached
  - comp_research_involvement: involvement in computing research
  - daily_broadband: students' daily access to broadbant
  - daily_home_computer: students' daily access to home computer
  - daily_lowspeed: students' daily access to low-speed internet
  - daily_school_computer: students' daily access to a school computer
  - daily_smartphone: students' daily access to a smart phone
  - teaching_adults_workplace: time spent teaching adults in the workplace
  - teaching_adults_free_range: time spent teaching adults in free-range settings
  - teaching_children_free_range: time spend teaching children in free-range settings
  - teaching_children_in_schools: time spent teaching children in schools
  - teaching_students_college: time spent teaching students in college
  - teaching_teens_free_range: time spent teaching teens in free-range settings
  - teaching_teens_in_schools: time spent teaching teens in schools

## question.csv

- Extracted programmatically 2018-11-02.
- Final list of questions presented for ranking.
- Fields:
  - id: unique question ID (1-1 with question ID in 'final-questions.csv' above)
  - category_id: question's category ID (foreign key to ID in 'category.csv' above)
  - content: text of question

## ranking.csv

- Extracted programmatically 2018-11-02.
- Rankings of questions.
- Fields:
  - id: unique ID for this ranking
  - stage: question ranking stage at which ranking provided
  - question_id: question's ID (foreign key to ID in 'question.csv' above)
  - person_id: person's ID (foreign key to ID in 'person.csv' above)
  - rank: rank selected

## question-coding.csv

- Constructed manually 2019-03-27.
- Classification of reasons and uses for questions.
- Fields:
  - ID: unique person identifier (foreign key to ID in 'person.csv' above)
  - Why_1...Why_5: Why do you want to know?
  - What_1...What_5: What would you do with the answers?
  - Question_1...Question_5: What questions would you like answered?
  - Rater_1...Rater_2: coding scheme
    - 0: no clear action (to teaching practice or otherwise) 
    - 1: some kind of action, but not a direct change to their personal teaching practice
    - 2: change/adjustment to their own teaching practice (what they personally do with their course/students)
  - Rater_Match: do Rater_1 and Rater_2 agree?

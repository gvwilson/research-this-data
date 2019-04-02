.mode csv

-- question categories
CREATE TABLE category (
  id integer not null,			-- category ID
  name text not null			-- category name
);
.import category-stripped.csv category

-- questions
CREATE TABLE question (
  id integer not null,			-- question ID
  category_id integer not null		-- question category (foreign key)
    references category(id),
  content text not null			-- question text
);
.import question-stripped.csv question

-- people
CREATE TABLE person (
  id integer not null,			-- person ID
  hash_id text not null,		-- hash ID to connect to actual identity
  last_updated_at datetime not null,    -- last update to person's profile
  stage integer not null,		-- stage they are at
  comp_research_involvement text,	-- computing research involvement
  daily_broadband text,	    		-- students' access to broadband
  daily_home_computer text,		-- students' access to computer at home
  daily_lowspeed text,			-- students' access to low-speed internet
  daily_school_computer text,		-- students' access to computer at school
  daily_smartphone text,		-- students' access to smart phone
  teaching_adults_workplace text,	-- teaching adults in the workplace
  teaching_adults_free_range text,	-- teaching free-range adults
  teaching_children_free_range text,	-- teaching free-range children
  teaching_children_in_schools text,	-- teaching children in schools
  teaching_students_college text,	-- teaching college/university students
  teaching_teens_free_range text,	-- teaching free-range teens
  teaching_teens_in_schools text	-- teaching teens in schools
);
.import person-stripped.csv person

-- question rankings
CREATE TABLE ranking (
  id integer not null,			-- ranking ID
  stage integer not null,		-- stage ranking done at
  question_id integer not null		-- question ranked (foreign key)
    references question(id),
  person_id integer not null		-- person doing the ranking (foreign key)
    references person(id),
  rank text				-- rank (as text)
);
.import ranking-stripped.csv ranking

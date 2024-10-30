CREATE TABLE GolfCourses ( -- This table contains information about golf courses
    CourseID INTEGER PRIMARY KEY,
    CourseName TEXT NOT NULL, -- Name of the golf course. Many distinct values.
    Location TEXT, -- Location of the course. Many distinct values.
    Holes INTEGER, -- Number of holes. Usually 18, sometimes 9.
    Par INTEGER, -- Par for the course. Range 68-72, most values 70-72.
    Length INTEGER -- Length of the course in yards. Range 5000-8000, normally distributed around 7000.
);
-- JOIN GRAPH: "GolfCourses": ["GolfTournaments", "GolfScores"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="GolfCourses">
-- - Description: This table contains information about golf courses
-- - Data:
-- -- CourseID: Primary key for the GolfCourses table
-- -- CourseName: Name of the golf course. Many distinct values.
-- -- Location: Location of the course. Many distinct values.
-- -- Holes: Number of holes. Usually 18, sometimes 9.
-- -- Par: Par for the course. Range 68-72, most values 70-72.
-- -- Length: Length of the course in yards. Range 5000-8000, normally distributed around 7000.
-- - Relationships:
-- -- (GolfCourses.CourseID → GolfTournaments.CourseID) - Table containing information about golf tournaments
-- -- (GolfCourses.CourseID → GolfScores.CourseID) - Table containing scores for golf tournaments
-- </METADATA>
-- 

-- File: mysports.GolfCourses.txt 
-- CourseID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- CourseName: TEXT FROM Augusta National Golf Club TO Whistling Straits like ['Whistling Straits', 'TPC Sawgrass', 'St Andrews Links (Old Course)', 'Royal Melbourne Golf Club', 'Pinehurst No. 2', 'Pebble Beach Golf Links', 'Oakmont Country Club', 'Muirfield', 'Bethpage Black Course', 'Augusta National Golf Club']
-- Location: TEXT FROM Augusta, Georgia TO St Andrews, Scotland like ['St Andrews, Scotland', 'Sheboygan, Wisconsin', 'Ponte Vedra Beach, Florida', 'Pinehurst, North Carolina', 'Pebble Beach, California', 'Oakmont, Pennsylvania', 'Gullane, East Lothian, Scotland', 'Farmingdale, New York', 'Black Rock, Victoria, Australia', 'Augusta, Georgia']
-- Holes: INTEGER FROM 18 TO 18 like [18]
-- Par: INTEGER FROM 71 TO 72 like [72, 71]
-- Length: INTEGER FROM 6579 TO 7790 like [7245, 7790, 7588, 7475, 7468, 7305, 7255, 7040, 6579]
-- 

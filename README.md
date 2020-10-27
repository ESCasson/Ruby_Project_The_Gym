Brief - Create an app to be used by a gym to manage exercise classes, membership and class attendance.  
Clean, professional style and layout.  Considering UX within technology constraints.
Extension - Displaying exercise classes on a current month calendar with the option of changing the date range.

Front page of the site is http://localhost:4567/

For planning and future enhancement options please see https://trello.com/b/QaFellsA/the-gym

To run this file you require sinatra and to run the seeds file you require pry.

Instructions

Clone the project1_the_gym directory
Open the project1_the_gym directory in terminal
Within terminal run-
1. "createdb thegym" to create the database
2. "psql -d thegym -f db/thegym.sql" - to create the tables etc.
3. "ruby db/seeds.rb" to add test data.
4. "ruby app.rb" to start the sinatra server
5. Enter localhost:4567 into the address bar of your browser.
--The site has been tested fully on Chrome.
--Safari has most functionality but care must be taken when adding a class as
--dates and times could be added in a way that will not allow the app to work correctly.

The site allows
- Members to be added, updated and deleted
- Upcoming Exercise classes to be added, updated and deleted, as well as attendees
  to be added and deleted to classes, (with business rule restrictions).
- Classes can also be viewed and accessed from the calendar.

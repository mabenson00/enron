
**Overview:**
To create a search for these email files I decided to parse and save the emails in the database, then save searches as a DB field that `has_many: emails`. I used a smaller subset of emails to start with, but it would work with the entire set. The vast majority of the work would be in the initial end. 

Most of the code is in `app/services`. I used a scaffold generator, but none of its actually used except the models.

**Initial Setup. NOTE: this might take a minute**

 1.  `rake db:create && rake db:migrate && rake parse_emails:parse`
 2. NOTE: this was created on a PC, but... should work on mac I think.

**Emails and Users** 
I created emails and users tables to make the searching easier. Users have many `sent_emails` and `received_emails` so people could search that way (theoretically). Emails have a subject and body. 

**Searches**

 - Searches have many emails, so in an ideal scenario, to search for "government", all you'd need to do is find that row of the table and get the related emails.
 - To get that started`rake parse_emails:parse` in `parse_emails.rake`seeded the search table as well as the emails. It goes through every word of every email, and either creates a new search record, or adds the email to that search record.
 - To actually search, open up the console and run `search = SearchService.new("WORDHERE")
 - The `SearchService.rb` will run through these steps
	 - 1. See if the word already exists in the search table
	 - 2. See if the search is a substring of any words in the search table (eg: `inform` will return results for `information`
	 - 3. Perform an actual search.

**Logs**

These are in the logs folder, but here are some examples.
Creating Users and Emails:

    I, [2020-03-17T12:56:02.213713 #18380]  INFO -- : email successfully created with subject Click. Spin. Chances to Win up to $10,000!
    I, [2020-03-17T12:56:02.214630 #18380]  INFO -- : user found with email not found
    I, [2020-03-17T12:56:02.217277 #18380]  INFO -- : user successfully created with email prizemachine@feedback.iwon.com
    I, [2020-03-17T12:56:02.222147 #18380]  INFO -- : user found with email pallen@enron.com
    I, [2020-03-17T12:56:02.879433 #18380]  INFO -- : email successfully created with subject NETCO

Creating Searches:

    I, [2020-03-17T12:56:03.862220 #18380]  INFO -- : created search: large
    I, [2020-03-17T12:56:03.866156 #18380]  INFO -- : created search: number
    I, [2020-03-17T12:56:03.871132 #18380]  INFO -- : created search: occuring
    I, [2020-03-17T12:56:03.875197 #18380]  INFO -- : created search: around
    I, [2020-03-17T12:56:03.879851 #18380]  INFO -- : found search: January
Searching for "inf"

    I, [2020-03-17T13:27:59.979668 #22024]  INFO -- : found similars for inf: ["information,", "information", "information.", "info", "information:"]

**TODO**

 - A lot... save new searches, deal with punctation, return things in a readable way, etc etc etc.

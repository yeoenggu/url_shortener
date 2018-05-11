# Installation
url_shortener require ruby 2.x and bundler.  

Install the dependencies and start the server.

```sh
$ cd url_shortener
$ bundle install
$ createdb url_shortener_development
$ createdb url_shortener_test
$ rake db:migrate
$ rails s
```

For production environments...
Please change the BASE_URL in config/application.xml to point to production server.
Remember to create the database and run migrations.

# Thought process
- start from model.  (from back to front)
	- I build a simple link model with the assumption of a simple algorithm
		- make use of database id, assume it would be unique.
		- base 32
	- thinking is to make it work and revisit later.
	- implemented testing for the model.
- I added api to the model
	- I wanted to do this to complete the loop at the back.
- I added the controller and views
	- The reason is that I want to go systematically from back to front.
	- Instead of using rails g to generate scaffolding.
	- I took the approach to code and to use rails g moderately (to speed things up and not to over rely)
		- I am ok with generate controller etc as long as the number of files generated are small and manageable.
		- I kept some of the generated file for future purposes (like mailer for example)
- Testing approach
	- I did unit testing for model.
	- I prefer request, feature testing over unit testing.
		- Unless necessary, I prefer not to add controller, routing testing.
- Metrics
	- I chose to use Instacart's Ahoy and Blazer gems to implement tracking.
	- The main reason is rather selfish.  I wanted to play with these gems for a long time in my shopify apps.
	- Pros
		- tools for tracking
		- exlore data faster and one can figure out what to track etc
		- by default exclude robots
		- framework 
			- to hook up to Amazon Kinesis Firehose and others for interesting use cases
	- Cons
		- more overheads


# If I have time ....
- Making it work better
	- add user
		- devise authentication
		- JWT for api
		- hook up user with ahoy
	- Improve algo for generating slug
	  - use base62 instead of base32
	  - refer to the following url
		https://medium.com/@roger35972134/leetcode-535-encode-and-decode-tinyurl-90113d08b1c
	- normalize urls
	  - use gem https://github.com/rwz/normalize_url
	  - normalize urls
	  - handle edge cases like parameters passing
	 - tracking with google analytics
	  - integrate with google analytics 
	- more tests
	- revisit Ahoy
		- make it run faster
			- change the datastore
				- at the moment, every request will cause 2 db transaction.
				- change it to write to in-memory datastore and schedule jobs to process it further.
				- interesting side effect that I can implement near real time use case like live view.
					- put all the shares in real time on a map.
- MVP
	- get initial customers and figure out their core use case and the metrics that they are interested
- Others
	- I did run into capybara problem in feature testing.
		- need to turn on tracing to figure out what is really happening.  Ran out of time to do it.





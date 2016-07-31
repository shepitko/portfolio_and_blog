# Planning my application
1. Answer Questions
	- What am I building?
	- Am I building it for?
	- What features do I need to have?
2. User Stories
3. Models my data
4. Pages which I need in my application
5. Gems which I need for implementation my application

## Questions

1. What am I building? I am building a personal site. A place where I can blog, share examples of my work, and have people contact me
2. Am I  building it for? I am building it for myself, but also for the ror-community. Sharing what I am learning by blogging is a great way to learn for myself, but I teach others in the process. Show potential employers that I know what I are doing.
3. What features do I need to have?
	- Posts
		- Create / Edit / Destroy
		- Markdown
		- Syntax highlighting
		- Comments
	- Projects
		- Create / Edit / Destroy
	- Contact
		- Contact form
		- Sendgrid
	- User (Devise)
	
## User Stories
	
As a user:
- I want to be able to create posts so that I can share what I am learning on my blog.
- I want to be able to edit & destroy posts, so that I can manage my blog.
- I want to be able to write posts in markdown format so that it’s easy for me to writes posts.
- I want to be able to highlight the various syntax of code blocks that I share on my blog.
- I want to show the visitors and potential employers examples of my work, or stuff I’ve built.
- I want to be able to have visitors contact me through a form on my site.
- I want visitors to be able to leave comments on my posts.

## Modeling our data
**Post**
	post_img:string
	title:string
	content:text

**Category**
	name:string

**Project**
	title:string
	description:text
	link:string

**User**

## Pages which I need in my application
	- Home
	- Posts#index
	- Posts#Show
	- Projects#index
	- Projects#show
	- Contact

## Gems which I need for implementation my application
	- PosgreSQL
	- Rails5
	- I18n
	- Sendgrid
	- Device
	- Omniauth (Facebook, VKontakte, Gmail, GitHub)
	- Doorkeeper
	- RABL/Jbuilder/ActiveModelSerializer
	- Haml
	- Sass
	- JQuery
	- Simple_form
	- Reform
	- Ckeditor
	- Sass-bootstrap
	- Kaminari
	- Paperclip
	- Rspec
	- ShouldaMatches
	- FactoryGirl
	- DatabaseCleaner
	- Capybara
	- Capybara-webkit
	- FFaker
	- Travis CI
	- SimpleCov
	- Capistrano
	- Chief
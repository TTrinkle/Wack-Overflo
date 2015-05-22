# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tanya = User.new(username: "TT", email: "tt@me.com", password: "12345")
ari = User.new(username: "AP", email: "ap@me.com", password: "12345")
brendan = User.new(username: "BM", email: "bm@me.com", password: "12345")
susie = User.new(username: "SS", email: "ss@me.com", password: "12345")
kevin = User.new(username: "KH", email: "kh@me.com", password: "12345")

quest1 = Question.create(title: "Add options to select without accessing the model from the view", body: "How can I add options from a database table without making a direct reference to the model in the Select form helper?PS: Not using JS too. Example: I have a states table with columns like Name, Abbreviation and ID. I have a select for states that need to be filled with the data from the states table. How should I do without using JS, but still following the MVC principles?", user_id: tanya)
quest2 = Question.create(title: "rabl nested custom template", body: "I have array openstruct data objects and I need to create a following custom nested template from that data How to do that using rabl template.I am following rabl documentation but still I am not able to construct as per my requirement. Any help is appriciated", user_id: ari )
quest3 = Question.create(title: "PUT method form_for", body: "I am using the following to try and set a PUT method on the form but it is still doing a post. I have referred to the docs and it seems like im doing this right.", user_id: brendan)
quest4 = Question.create(title: "Why does not work ngclick from AJAX?", body: "I get HTML from AJAX and put it on page. This HTML has ng-click event, that does not work. Only after reload page. What is way does exist to resolve it?", user_id: brendan)


answer1 = Answer.create(author_id: kevin ,question_id: quest1, body:"In jQuery, you design a page, and then you make it dynamic. This is because jQuery was designed for augmentation and has grown incredibly from that simple premise. But in AngularJS, you must start from the ground up with your architecture in mind. Instead of starting by thinking I have this piece of the DOM and I want to make it do X, you have to start with what you want to accomplish, then go about designing your application, and then finally go about designing your view. ")
answer2 = Answer.create(author_id: susie ,question_id: quest2, body: "Alternatively, make this a helper_method in your model, and pass that helper_method instead of the attribute." )
answer3 = Answer.create(author_id: ari ,question_id: quest2, body: "Depending on your use case, you may want to format the date in the application receiving the response rather than in the response itself. This will keep your RABL templates decoupled from the final rendering of the date and thus more easily consumable.")
answer4 = Answer.create(author_id: ari ,question_id: quest4, body: "Write ur code like this, not the other way you are trying to do.")
answer5 = Answer.create(author_id: brendan ,question_id: quest4, body: "I suppose one solution is for you to refine your selector which you pass to jQuery's load function so it inserts #main-content's children instead of itself.")

project_list = [
  [
    "Bootstrap Calculator",
    "/images/projects/bs_calc.jpg",
    "http://earsplitting-wilderness.surge.sh/",
    "A basic online calculator all in default bootstrap colors."
  ],
  [
    "Pomodoro Clock",
    "/images/projects/clock.jpg",
    "http://romantic-trouble.surge.sh/",
    "A pomodoro clock that I used as the sample solution to the pairing " \
    "project for The Odin Project."
  ],
  [
    "Wikiview",
    "images/projects/wikiview.jpg",
    "https://measly-oatmeal.surge.sh/",
    "A Wikipedia viewer app. I'm quite proud of the design on this site."
  ],
  [
    "Random Quote Machine",
    "/images/projects/random_quote.jpg",
    "http://fluttering-force.surge.sh/",
    "A random quote machine that makes use of some of my pictures."
  ],
  [
<<<<<<< HEAD
    "Widdle Waskles Grooming",
    "/images/projects/widdle.jpg",
    "https://stark-bastion-50262.herokuapp.com/",
    "A website I made for a friend. It also has a " \
    "<a href='https://stark-bastion-50262.herokuapp.com/jenna'>handmade CMS</a>" \
    " (username: user password: password)"
  ],
  [
    "Caesar's Cipher",
    "/images/projects/caesar.jpg",
    "https://salty-hamlet-78507.herokuapp.com/",
    "A sinatra front end for a Ruby Caesar's Cipher project"
  ]
=======
    "Widdle Waskles",
    "/images/projects/widdle.jpg",
    "https://stark-bastion-50262.herokuapp.com/",
    "A website I built for a friend with a " \
    "<a href='https://stark-bastion-50262.herokuapp.com/jenna'>handmade " \
    "CMS</a> (ID: user, PASSWORD: password)"
  ],
  [
    "Caesar's Cipher",
    "images/projects/caesar.jpg",
    "https://salty-hamlet-78507.herokuapp.com/",
    "A sinatra front end for a Ruby Caesar's Cipher program"]
>>>>>>> e682e4d86bf055746cd60f94f69a28c972f54cc6
]

project_list.each do | title, image, url, description |
  Project.create(title: title,
                 image_link: image,
                 url: url,
                 description: description)
end

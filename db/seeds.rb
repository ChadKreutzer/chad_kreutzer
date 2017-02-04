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
    "A pomodoro clock that I usedas the sample solution to the pairing " \
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
    "A random quote machine that makes use of some of my pictures."]
]

project_list.each do | title, image, url, description |
  Project.create(title: title,
                 image_link: image,
                 url: url,
                 description: description)
end

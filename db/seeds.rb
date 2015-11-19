# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def fake_user

  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  email = Faker::Internet.email
  password = Faker::Internet.password

  @user = User.create(firstname: firstname,
                      lastname: lastname,
                      email: email,
                      password: password,
                      password_confirmation: password
                      )
end

def fake_movie

  title = Faker::Lorem.sentence.titleize.chomp(".")
  director = Faker::Name.name
  random_minutes = Random.new
  runtime_in_minutes = random_minutes.rand(60..200)
  description = Faker::Lorem.paragraph
  release_date = Faker::Date.backward(25000)
  @movie = Movie.create(title: title, 
                        director: director, 
                        runtime_in_minutes: runtime_in_minutes,
                        description: description,
                        release_date: release_date,
                        )
end

def fake_review

  number_of_movies = Movie.count
  random_movie = Random.new 
  movie = Movie.find(random_movie.rand(Movie.first.id..Movie.last.id))
  number_of_users = User.count
  random_user = Random.new
  user = User.find(random_user.rand(User.first.id..User.last.id))
  text = Faker::Lorem.paragraph
  random_rating = Random.new
  @review = Review.create(movie: movie, 
                          user: user, 
                          text: text,
                          rating_out_of_ten: random_rating.rand(1..10)
                          )

end


100.times do
  fake_user
end

50.times do
  fake_movie
end

400.times do
  fake_review
end

10.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Name.name

  uid ="uid123r#{n}"
  provider = "pandarbook#{n}"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               name: name,

               uid: uid,
               provider: provider,
               )
end

10.times do |no|
  Topic.create(:title => "title #{no}", :user_id => 17, :content => "pan #{no}")
end

10.times do |no|
  Comment.create(:content => "panda #{no}", :user_id =>17, :topic_id => 94)
end

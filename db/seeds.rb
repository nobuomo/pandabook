
10.times do |no|
  Topic.create(:title => "title #{no}", :user_id => 1, :content => "pan #{no}")

end

10.times do |no|
  Comment.create(:content => "panda #{no}", :user_id =>1, :topic_id => 1)
end


10.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Name.name
  image_url =  Faker::Avatar.image
  avatar=Faker::Avatar.image("my-own-slug", "10x10", "bmp")
  uid ="uid123r#{n}"
  provider = "pandarbook#{n}"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               name: name,
               image_url: image_url,
               avatar: avatar,
               uid: uid,
               provider: provider,
               )
end


10.times do |no|
  Topic.create(:title => "title #{no}")
end

10.times do |no|
  Comment.create(:content => "panda #{no}")
end


10.times do |n|
  email = Faker::Internet.email
  password = "password"
  image_url =  Faker::Avatar.image
  uid ="uid123#{n}"
  provider = "pandabook#{n}"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               image_url: image_url,
               uid: uid,
               provider: provider,
               )
end

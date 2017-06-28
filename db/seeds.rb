
10.times do |no|
  Topic.create(:title => "title #{no}")
end

10.times do |no|
  Comment.create(:content => "panda #{no}")
end


10.times do |n|
  email = Faker::Internet.email
  password = "password"
  avatar = "avatar"
  uid ="uid"
  provider = "pandabook"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               avatar: avatar,
               uid: uid,
               provider: provider,
               )
end

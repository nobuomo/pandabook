
10.times do |no|
  Topic.create(:title => "title #{no}")
end

10.times do |no|
  Comment.create(:content => "panda #{no}")
end


10.times do |n|
  email = Faker::Internet.email
  password = "password"
  faker = "faker"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               faker: faker,
               )
end

# User.create(:name => 'jone', :email => 'xxx@com', :password => "passsord", :uid => "ppp", :provider => "wwww", :image_url=>"http://pbs.twimg.com/profile_images/645772828/CIMG...", :avatar =>"rrr")
#
# User.seed(:id) do |s|
#   s.id = 1
#   s.name = "jon"
#   s.email = "ppp@com"
#   s.password = "password"
#   s.uid = "pamda"
#   s.provider ="yama"
#   s.image_url = "http://pbs.twimg.com/profile_images/645772828/CIMG..."
#   s.avatar ="aaa"
# end
#
# User.seed(:id) do |s|
#   s.id = 2
#   s.name = "emily"
#   s.email = "qqq@com"
#   s.password = "password"
#   s.uid ="kame"
#   s.provider ="yamaq"
# end
#
#
# User.seed(:id) do |s|
#   s.id = 3
#   s.name = "jone"
#   s.email = "pppe@com"
#   s.password = "password"
#   s.uid = "pamdae"
#   s.provider ="yamaeb"
# end
#
# User.seed(:id) do |s|
#   s.id = 4
#   s.name = "emilyf"
#   s.email = "qqqf@com"
#   s.password = "fpassword"
#   s.uid ="fkame"
#   s.provider ="yamaebq"
# end
#
#
# User.seed(:id) do |s|
#   s.id = 5
#   s.name = "gjon"
#   s.email = "gppp@com"
#   s.password = "gpassword"
#   s.uid = "gpamda"
#   s.provider ="gyamav"
# end
#
# User.seed(:id) do |s|
#   s.id = 6
#   s.name = "hemily"
#   s.email = "hqqq@com"
#   s.password = "hpassword"
#   s.uid ="hkame"
#   s.provider ="yamaebh"
# end
#
#
# User.seed(:id) do |s|
#   s.id = 7
#   s.name = "pjon"
#   s.email = "pppp@com"
#   s.password = "ppassword"
#   s.uid = "ppamda"
#   s.provider ="pyamaf"
# end
#
# User.seed(:id) do |s|
#   s.id = 8
#   s.name = "qemily"
#   s.email = "qqqq@com"
#   s.password = "qpassword"
#   s.uid ="qkame"
#   s.provider ="yamaebbb"
# end
#
#
# User.seed(:id) do |s|
#   s.id = 9
#   s.name = "rjon"
#   s.email = "rppp@com"
#   s.password = "rpassword"
#   s.uid = "rpamda"
#   s.provider ="ryama"
# end
#
# User.seed(:id) do |s|
#   s.id = 10
#   s.name = "semily"
#   s.email = "sqqq@com"
#   s.password = "spassword"
#   s.uid ="skame"
#   s.provider ="yamaebcc"
# end

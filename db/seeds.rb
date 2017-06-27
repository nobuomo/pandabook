5.times do |n|
  email = Faker::Internet.email
  password = "password"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               )
end
#
# User.seed(:id) do |s|
#   s.id = 1
#   s.name = "jon"
#   s.email = "ppp@com"
#   s.password = "password"
#   s.uid = "pamda"
#   s.provider ="yama"
#
# end
#
# User.seed(:id) do |s|
#   s.id = 2
#   s.name = "emily"
#   s.email = "qqq@com"
#   s.password = "password"
#   s.uid ="kame"
#   s.provider ="kawa"
# end

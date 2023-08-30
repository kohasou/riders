souta= User.find_or_create_by!(email: "test@example.com") do |user|
  user.first_name = "Souta"
  user.last_name = "Kohama"
  user.nickname = "Kohasou"
  user.telephone_number = "08000000000"
  user.password = "03031220"
end 


  

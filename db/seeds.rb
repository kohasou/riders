souta= Admin.find_or_create_by!(email: "test@example.com") do |admin|
  admin.password = "1220303"
end

souta= User.find_or_create_by!(email: "test1@example.com") do |user|
  user.first_name = "Souta"
  user.last_name = "Kohama"
  user.nickname = "Kohasou"
  user.telephone_number = "08000000000"
  user.password = "030312"
end

tarou= User.find_or_create_by!(email: "test2@example.com") do |user|
  user.first_name = "Tarou"
  user.last_name = "Tanaka"
  user.nickname = "Tarou"
  user.telephone_number = "08000000000"
  user.password = "012000"
end

Post.find_or_create_by!(body: "こんにちは") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post.user_id = "1"
end

Post.find_or_create_by!(body: "はじめまして") do |post|
  post.user_id = "1"
end




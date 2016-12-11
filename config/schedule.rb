every 10.second do
  User.all.each do |user|
    user.babble
  end
end

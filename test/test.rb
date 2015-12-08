hash = [{"username"=>"a477993", "pw"=>"11xiao24", "privilege"=>"teacher"}, {"username"=>"aaa", "pw"=>"aa", "privilege"=>"student"}]

puts hash.find {|hash| hash["username"] == "a477993"}["privilege"]
When(/^I open the dataguru login page$/) do
  @br.goto @@site_map["dataguru_login"]
end

And(/^I input my "([^"]*)" and "([^"]*)"$/) do |username, pw|
  login_page.username= username
  login_page.password= pw
end

Then(/^I refer below data table:$/) do |table|
  #table is a table.hashes.keys # => [:username, :pw, :privilege]
  #puts table.hashes.inspect

  hash = [{"username" => "a477993", "pw" => "11xiao24", "privilege" => "teacher"}, {"username" => "aaa", "pw" => "aa", "privilege" => "student"}]
  hash.find { |hash| hash["username"] == "a477993" }["privilege"]
end

And(/^I refer below DOC string;$/) do |text|
  puts JSON.parse(text).inspect
end
When(/^I open the login page$/) do
  @br.goto @@site_map["dataguru_login"]
end

And(/^Input the "([^"]*)" and "([^"]*)"$/) do |username, pw|
  login_page.username= username
  login_page.password= pw
end

And(/^I click the login button$/) do
  login_page.login_form_element.submit
end

Then(/^The current page should be home page after successful login$/) do
  sleep 3
  @br.url.should include "www.dataguru.cn"
end
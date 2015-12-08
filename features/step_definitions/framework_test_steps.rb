

When(/^I want open "([^"]*)" via the browser$/) do |web_site|
  @br.goto web_site
end
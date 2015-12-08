require 'watir-webdriver'

b = Watir::Browser.new :chrome
b.goto 'http://money.163.com/15/0908/01/B2V0S58600253B0H.html'
link = b.link(:xpath => '//*[@id="epContentLeft"]/div/div[2]/div[2]/div[2]/a[2]')
puts link.text
#
# Watir::Wait.until { b.text.include? 'Thank you' }
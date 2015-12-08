require 'watir-webdriver'
#b = Watir::Browser.new
b = Watir::Browser.new :chrome
b.goto 'http://baidu.com'
b.title
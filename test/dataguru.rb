require 'watir-webdriver'
b = Watir::Browser.new :chrome
b.goto "http://www.dataguru.cn/member.php?mod=logging&action=login"
username = b.text_field :name => "username"
username.set "a477993"
password = b.text_field :name => "password"
password.set '11xiao24'
btn = b.form :name => 'login'
btn.submit




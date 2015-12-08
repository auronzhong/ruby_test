require 'page-object'

class Login
  include PageObject
  text_field(:username, :name => "username")
  text_field(:password, :name => "password")
  form(:login_form, :name => "login")


end
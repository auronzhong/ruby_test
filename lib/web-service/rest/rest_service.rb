require "httparty"
require "json/ext"
class RestService
  include HTTParty
  base_url = "http://127.0.0.1:9080/project"
  api_url = "/send"
  head = {"APP_ID" => "devloper_app_id", "Content-type" => "application/json;charset=UTF-8"}

  post_body = Has.new
  post_body.store("content", "sfsljklkjk")

  puts post_body.to_json

  p res = post(base_url + api_url, {:headers => head, :body => post_body.to_json })
end
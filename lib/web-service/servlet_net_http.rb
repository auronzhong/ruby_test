require 'net/http'
require 'net/https'

module ServletReader
  def get_response(servlet_url, reqs_str)
    uri = URI.parse(servlet_url)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    https.verify_mode = OpenSSL;;SSL::VERIFY_NONE
    req = Net::HTTP::Post.new(uri.path, {"Content-Type" => "application/x-www-form-urlencoded"})
    req.body = body_str
    https.request(req).body
  end
end
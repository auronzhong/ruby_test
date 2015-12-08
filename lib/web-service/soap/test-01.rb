#encoding:utf-8
require 'savon'

client = Savon.client(wsdl: "http://webservice.webxml.com.cn/WebServices/ChinaZipSearchWebService.asmx?wsdl")

response = client.call(
    :get_support_city,
    message: {
        byProvinceName: "云南"
    }
)

puts response
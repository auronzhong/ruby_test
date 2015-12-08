#encoding:utf-8
require 'savon'

client = Savon.client(wsdl: "http://webservice.webxml.com.cn/WebServices/MobileCodeWS.asmx?wsdl")

response = client.call(
    :get_mobile_code_info,
    message: {
        mobileCode: "18017766815",
        userID: ""
    }
)

puts response

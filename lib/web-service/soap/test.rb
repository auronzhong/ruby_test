#encoding:utf-8
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require '../../web-service/soap/soap_client'

client = SoapClient.new("https://kfsldjfsdlkj?wsdl")
puts client.get_hsbc_credentials("", "").inspect

require 'savon'
class SoapClient
  attr_accessor :wsdl
  attr_reader :end_point

  def initialize(wsdl)
    @end_point = wsdl.split("?")[0] if wsdl.include? "?wsdl"
    @client = Savon.client(
        wsdl: wsdl,
        endpoint: @end_point,
        namespace: "name_space",
        # proxy: "http://proxy-host:port"
        ssl_verify_mode: :none,
        ssl_version: :TLSv1,
        env_namespace: :soapenv,
        namespace_identifier: :svc,
        element_from_default: :unqualified,
        soap_header: {
            "svc:CredentialHeader" => {
                "username" => "username",
                "password" => "password"
            }
        }
    )
  end

  def get_hsbc_credentials(hkid, hkidType)
    reponse = @client.call(
        :get_hsbc_credentials,
        message: {
            channel: "",
            hkid: hkid,
            hkidType: hkidType
        }
    )
    response.body[:get_hsbc_credentials_response]
  end
end
#require 'spec/expectations'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
Dir.glob(File.join(File.dirname(__FILE__), "pages/*.rb")).each { |f| require f }

require 'browser-provider/web_driver_browser_factory'
require 'yaml'
require 'json/ext'


@@site_map = YAML.load(File.open(File.dirname(__FILE__) + '/../../config/sitemap.yml'))
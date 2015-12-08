
require File.dirname(__FILE__) + '/../features/pages/courses'
require File.dirname(__FILE__) + '/../lib/browser-provider/web_driver_browser_factory'


browser_type = 'chrome'
args =Hash.new
args.store(:browser, browser_type)

@br = WebDriverBrowserFactory.new(args).get_browser_instance
@br.goto "https://www.fidelity.com.tw/web/fund-products/default.page?"

courses = Courses.new(@br)
courses.table_element.each do |row|
  row.each {|cell| puts cell.text }
end
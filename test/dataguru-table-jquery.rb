require File.dirname(__FILE__) + '/../features/pages/courses'
require File.dirname(__FILE__) + '/../lib/browser-provider/web_driver_browser_factory'
require 'json/ext'


browser_type = 'firefox'
args =Hash.new
args.store(:browser, browser_type)

@br = WebDriverBrowserFactory.new(args).get_browser_instance
@br.goto "https://www.fidelity.com.tw/web/fund-products/default.page?"

script = <<-js
  var trArr = new Array()
  $("#navListTable").each(function(){
        var course = new Array()
        $(this).find("td").each(function(index){
          course.push($(this).html())
})
trArr.push(course)
})
var json_string = JSON.stringify(trArr)
return json_string
js

arr = JSON.parse(@br.execute_script(script))
puts arr
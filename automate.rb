require 'rubygems'
require 'selenium-webdriver'
require 'json'

browser_caps = File.read(ARGV[0])
puts ARGV[0].class
# browser_caps = JSON.parse(browser_caps)
# url = ""
# env = ARGV[0]
# case env
#   when "prod"
#     url = "http://junaidkirkire1:vKKprzxyjakqpunTz9Gj@hub.browserstack.com/wd/hub"
#   when "wtf"
#     url = "http://abc19:FosQgLWq3zJp5qZgezjt@wtfhub.browserstack.com:4444/wd/hub"
#   when "wtf2"
#     url = "http://arpitpatel1:TcPDWfkMMkkJn1wYytct@wtf2hub.browserstack.com:8080/wd/hub"
#   when  "fu"
#     url = "http://arpitpatel1:5TYHwqVRVya7Efq7sL23@fuhub.browserstack.com:8080/wd/hub"
#   when "platformdev"
#     url = "http://kashyapmurthy1:pHVvEDmKBhpEjer3n94N@platformdev.bsstag.com:4444/wd/hub"
#   else
#     url = "http://arpitpatel2:1DtykDRDyVfCsZ59rGjF@hub.browserstack.com/wd/hub"
# end


# json.each do |item|
#   caps = Selenium::WebDriver::Remote::Capabilities.new
#   caps['browser'] = item["browser"]
#   caps['browser_version'] = item["browser_version"]
#   caps['os'] = item["os"]
#   caps['os_version'] = item["os_version"]
#   caps['resolution'] = item["resolution"]
#   caps['browserstack.networkLogs'] = 'true'
#   caps['build'] = "AutoTst" #item["build"]
#   caps['browserstack.debug'] = 'true'
#   caps['browserstack.local'] = 'true'
#   driver = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => caps)
#   1.times do
#     driver.get "http://localtesting.browserstack.com:80/"
#   end
#   puts "title : "+driver.title
#   driver.quit
# end

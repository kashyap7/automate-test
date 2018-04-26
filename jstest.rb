require 'rubygems'
require 'json'
require 'rest-client'

wait = 5
wait_limit = 0
url = ""
env = ARGV[0]

json = File.read('browsers2.json')
json = JSON.parse(json)
#ac=RestClient.get("http://arpitpatel2:1DtykDRDyVfCsZ59rGjF@api.browserstack.com/3/browsers",:content_type=>'application/json',:accept=>'application/json')
#ac=JSON.parse(ac)
#puts ac

case env
	when "prod"
		url = "https://junaidkirkire1:vKKprzxyjakqpunTz9Gj@api.browserstack.com/4/worker"
	when "wtf"
		url = "https://junaid1:T93C3x4GJKzCcsGzW6ow@apiwtf.bsstag.com/4/worker"
	when "wtf2"
		url = "https://arpitpatel1:TcPDWfkMMkkJn1wYytct@apiwtf2.browserstack.com/3/worker"
	when  "fu"
		url	= "https://junaidkirkire1:3Jwi2bh8ZVTVnAefTUSV@apifu.bsstag.com/4/worker"
  when "platformdev"
    url = "https://jkrk1:EwY6hAuicWWAcRX8RzFP@apiplatformdev.bsstag.com/4/worker"
  when "hulk"
    url = "https://junaidkirkire1:cDdwzpbsWJhvqYbtDAiy@apihulk.bsstag.com/4/worker"
  when "wonderwoman"
    url = "https://junaidkirkire1:Ye6Azppv875PmdaXpBzb@apiwonderwoman.bsstag.com/4/worker"
	else
		url = "https://arpitpatel2:1DtykDRDyVfCsZ59rGjF@api.browserstack.com/3/worker"
end

json.each do |item|
	wait_limit = 0
	puts "Creating Worker"
	worker = RestClient.post("#{url}",item.to_json,:content_type=>'application/json',:accept=>'application/json')
	puts "Worker Created"
	workr = JSON.parse(worker)
	id = workr["id"]
	puts "Worker id : #{id}"

	while wait_limit < 90
  		status = RestClient.get("#{url}/#{id}",:content_type=>'application/json',:accept=>'application/json')
		status = JSON.parse(status)
		s = status["status"]
		puts "Worker status : #{s}"

		if s == "running"
			puts "Taking Screenshot..."
			RestClient.get("#{url}/#{id}/screenshot.png",:content_type=>'application/json',:accept=>'img/png')
			puts "Screenshot taken"
			break
		else
			wait_limit = wait_limit + wait
			sleep(wait)
	 	end
	end

	if wait_limit == 90
		puts "Worker was in queue. So Screenshot was not taken"
	end

	puts "Deleting Worker"
	RestClient.delete("#{url}/#{id}")
	puts "Deleted worker"

end

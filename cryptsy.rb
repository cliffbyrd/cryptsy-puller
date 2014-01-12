require 'mechanize'

# This method retrieves info from cryptsy.com
def retrieve_info
	puts "Retrieving info from the website cryptsy.com.  This may take a few moments."
	agent = Mechanize.new
	page = agent.get('http://cryptsy.com')
	puts "Retrieval of information complete."
	return page
end

#This method parses the info retrieved from crytsy
def parse_info(page, ary)
	page_ary = page.links.to_ary
	page_ary.each {|link| if /DOGE\/BTC/x.match(link.to_s)
		ary.push(link.to_s) end }
	return ary
end

ary = []
page = retrieve_info
ary_return = parse_info(page, ary)

puts ary_return
#doge = ary[0].split
#puts "The current trade price of " + doge[0] + " is " + doge[1]

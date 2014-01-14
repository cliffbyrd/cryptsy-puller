#!/usr/bin/ruby
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

def displayWelcomeInfo
	puts "-b | --bitcoin : shows all currencies that can be traded in BTC"
	puts "-h | --help : display this information again"
	puts "-l | --litecoin: shows all currencies that can be traded in LTC"
	puts "-s | --search : enter a currency to search for"
end

def showBitcoinCurrency
	puts "Coming Soon!"
end

def showLitecoinCurrency
	puts "Coming Soon!"
end

def	searchAndShowCurrency
	puts "Coming Soon!"
end


#This is the beginning of the script
case ARGV[0]
when nil, "-h", "--help"
	displayWelcomeInfo
when "-b", "--bitcoin"
	showBitcoinCurrency
when "-l", "--litecoin"
	showLitecoinCurrency
when "-s", "--search"
	searchAndShowCurrency
else
	displayWelcomeInfo
end

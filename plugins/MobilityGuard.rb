##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MobilityGuard" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-05
version "0.1"
description "MobilityGuard is a suite of security products from the company by the same name. - Homepage: http://www.mobilityguard.com/"

# ShodanHQ results as at 2011-08-05 #
# 123 for MobilityGuard

# Examples #
examples %w|
https://m02-mg-local.ext.mobilityguard.se/
80.254.244.219
195.198.72.210
194.22.7.53
80.254.244.219
195.198.72.210
194.22.7.53
194.16.15.7
194.103.205.108
212.214.132.11
194.71.214.33
195.84.66.20
88.131.46.93
|

# Matches #
matches [

# Cookies Required Page # More info link # /mg-local/cookie.html
{ :url=>"/mg-local/cookie.html", :text=>'<font size=2>Click here for more information about MobilityGuard.</font></a></center><br>' },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @meta["server"] =~ /^MobilityGuard/

		m << { :name=>"HTTP Server Header" }

		if @meta["server"] =~ /^MobilityGuard v([^\s]+)$/
			m << { :version=>"#{$1}" }
		end
	end

	# Return passive matches
	m
end
end


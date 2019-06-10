function google-time -d "Gets time from google.com server"
	curl -I --silent 'http://google.com/' | grep -i '^date:'
end

function ping-8 -d "Pings google.com 3 times"
	ping -c 3 8.8.8.8
end


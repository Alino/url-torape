#! /bin/bash
# this script requires tor and torsocks to operate
# created by Alexander Sadovsky
# purpose - just to rape some url, using random user browser agent and different IP address each time until infinity.


url="http://mxtoolbox.com/WhatIsMyIP/"


#firefox
USER_AGENT[0]='"Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0"'
USER_AGENT[1]='Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20120101 Firefox/29.0'
USER_AGENT[2]='Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/29.0'
USER_AGENT[3]='Mozilla/5.0 (X11; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0'
USER_AGENT[4]='Mozilla/5.0 (Windows NT 6.1; rv:27.3) Gecko/20130101 Firefox/27.3'
USER_AGENT[5]='Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:24.0) Gecko/20100101 Firefox/24.0'
#chrome
USER_AGENT[6]='Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36'
USER_AGENT[7]='Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36'
USER_AGENT[8]='Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36'
USER_AGENT[9]='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1944.0 Safari/537.36'
USER_AGENT[10]='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.47 Safari/537.36'
#internet explorer
USER_AGENT[11]='Mozilla/5.0 (compatible; MSIE 10.6; Windows NT 6.1; Trident/5.0; InfoPath.2; SLCC1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 2.0.50727) 3gpp-gba UNTRUSTED/1.0'
USER_AGENT[12]='Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)'
USER_AGENT[13]='Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)'
USER_AGENT[14]='Mozilla/5.0 (Windows; U; MSIE 9.0; WIndows NT 9.0; en-US))'
USER_AGENT[15]='Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET CLR 2.0.50727; Media Center PC 6.0)'
USER_AGENT[16]='Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB7.4; InfoPath.2; SV1; .NET CLR 3.3.69573; WOW64; en-US)'
#safari
USER_AGENT[17]='Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25'
USER_AGENT[18]='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.13+ (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2'
USER_AGENT[19]='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.55.3 (KHTML, like Gecko) Version/5.1.3 Safari/534.53.10'
USER_AGENT[20]='Mozilla/5.0 (iPad; CPU OS 5_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko ) Version/5.1 Mobile/9B176 Safari/7534.48.3'
#opera
USER_AGENT[21]='Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'
USER_AGENT[22]='Opera/12.80 (Windows NT 5.1; U; en) Presto/2.10.289 Version/12.02'
#android webkit browser
USER_AGENT[23]='Mozilla/5.0 (Linux; U; Android 4.0.3; ko-kr; LG-L160L Build/IML74K) AppleWebkit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30'
USER_AGENT[24]='Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari'
#opera mobile
USER_AGENT[25]='Opera/12.02 (Android 4.1; Linux; Opera Mobi/ADR-1111101157; U; en-US) Presto/2.9.201 Version/12.02'
USER_AGENT[26]='Opera/9.80 (Android 2.3.3; Linux; Opera Mobi/ADR-1111101157; U; es-ES) Presto/2.9.201 Version/11.50'




echo "Press [CTRL+C] to stop..."
#for i in $(seq 0 2)
while :
do
	random_user_agent=${USER_AGENT[$RANDOM % ${#USER_AGENT[@]} ]}
	torsocks wget -U "$random_user_agent" "$url"
	killall -HUP tor
done

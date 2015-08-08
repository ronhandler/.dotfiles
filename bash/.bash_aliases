alias ls='ls --color'
alias l='ls -la'
alias ll='ls -l'
alias la='ls -A'
#alias capture='fswebcam --jpeg 100 --no-banner test.jpg'
alias capture='fswebcam --jpeg 100 --no-banner -i 0 --device /dev/video0 -r 320x240 test.jpg'
alias spaceron='PROMPT_COMMAND="echo"'
alias spaceroff='PROMPT_COMMAND=""'


postman () {
   if [ "$3" ]
   then
	   curl  -H "Content-Type: application/json" $1 -X $2 -d "$3" 2>/dev/null | jq .
   else
	   if [ $2 ]
	   then
	       curl -H "Content-Type: application/json" $1 -X $2 2>/dev/null | jq .
	   else
		   if [ $1 ]
		   then
				continue
		   else
		        echo Error: 1nd argument should be URL.
		   fi
		   echo Error: 2nd argument should be HTTP request type.
	   fi
   fi

   return 0
}

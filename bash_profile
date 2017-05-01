q# Aliases
alias load='nload -u K'
alias shutdown='sudo shutdown -h now'
alias restart='sudo reboot'
alias reboot='sudo reboot'
alias hddtemps='sudo hddtemp /dev/sda /dev/sdb /dev/sdc'
alias mydesk="dvtm htop 'screen -SRd mydesk3' 'screen -SRd mydesk2' 'screen -SRd mydesk1'"
alias rtstart='sudo /etc/init.d/rtorrent start'
alias rtstop='sudo /etc/init.d/rtorrent stop'
alias rt='sudo login rtorrent'
alias startvnc='tightvncserver -nolisten tcp -localhost :1'
alias stopvnc='tightvncserver -kill :1'
alias codserver='screen -S cod4 sudo su cod4 -c "cd ~; /media/raid/cod4/cod4_lnxded +exec 28960.cfg +map mp_crossfire +set net_port 28960"'
alias b3server='screen -S b3 sudo su cod4 -c "cd ~; python /media/raid/cod4/b3/b3_run.py -c /media/raid/cod4/b3/b3/conf/b3.xml"'
alias codtail='screen -S codtail /home/server/codtail'
alias cmserver='screen -S codcm sudo su cod4 -c "cd ~; /media/raid/cod4/cod4_lnxded +exec 28961.cfg +map mp_crossfire +set net_port 28961"'
alias fahscreen='screen -SRd folding'
alias fah='/home/server/fah'

## IPTables INFO
# to ban IP
# sudo iptables -A INPUT -s <IP> -j DROP
# for chain name > we can do INPUT, OUTPUT, FORWARD
# for effect > we can do ACCEPT, DENY (sends error message back), DROP (ignores packet)
# -A adds rule
# sudo iptables -A <Chain_Name> -s <IP> -j <effect>
# -j specifies effect (ACCEPT, DENY, DROP)
# to remove rule:
# -D removes rule
# sudo iptables -D <Chain_Name> <Rule_number>
# rule starts with 1 and counts down from the top of the list
# sudo iptables -L to list
# Guide: http://www.cae.wisc.edu/iptables-using

# To add new rules to IPTables, log in as root and modify /etc/default/iptables
# to restore, do iptables-restore < /etc/default/iptables

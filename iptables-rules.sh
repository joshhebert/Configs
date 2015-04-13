#!/usr/bin/bash

#Flush all tables
	iptables -F
	iptables -X
	iptables -t nat -F
	iptables -t nat -X
	iptables -t mangle -F
	iptables -t mangle -X
	iptables -t raw -F
	iptables -t raw -X
	iptables -t security -F
	iptables -t security -X
	iptables -P INPUT ACCEPT
	iptables -P FORWARD ACCEPT
	iptables -P OUTPUT ACCEPT

#Create new chains
	iptables -N LOGGING-INBOUND
	iptables -N LOGGING-OUTBOUND

#Default policy
	iptables -P INPUT DROP
	iptables -P FORWARD DROP
	iptables -P OUTPUT DROP

#Allow anything from loopback
	iptables -A INPUT  -i lo -j ACCEPT
	iptables -A OUTPUT -o lo -j ACCEPT


# Check Packet Validity
	iptables -A INPUT   -m state --state INVALID -j LOGGING-INBOUND
	iptables -A OUTPUT  -m state --state INVALID -j LOGGING-OUTBOUND

# Drop fragmented packets
	iptables -A INPUT -f -j LOGGING-INBOUND

# Some sketchy packets
	iptables  -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH 			-j LOGGING-INBOUND
	iptables  -A INPUT -p tcp --tcp-flags ALL ALL 		  			-j LOGGING-INBOUND
	iptables  -A INPUT -p tcp --tcp-flags ALL NONE 					-j LOGGING-INBOUND
	iptables  -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST 			-j LOGGING-INBOUND
	iptables  -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN 			-j LOGGING-INBOUND
	iptables  -A INPUT -p tcp --tcp-flags FIN,ACK FIN 				-j LOGGING-INBOUND
	iptables  -A INPUT -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG 	-j LOGGING-INBOUND

#Reject spoofed packets
	iptables -A INPUT -s 10.0.0.0/8       -j LOGGING-INBOUND
	iptables -A INPUT -s 192.0.0.1/24     -j LOGGING-INBOUND
	iptables -A INPUT -s 169.254.0.0/16   -j LOGGING-INBOUND
	iptables -A INPUT -s 172.16.0.0/12    -j LOGGING-INBOUND
	iptables -A INPUT -s 224.0.0.0/4      -j LOGGING-INBOUND
	iptables -A INPUT -d 224.0.0.0/4      -j LOGGING-INBOUND
	iptables -A INPUT -s 240.0.0.0/5      -j LOGGING-INBOUND
	iptables -A INPUT -d 240.0.0.0/5      -j LOGGING-INBOUND
	iptables -A INPUT -s 0.0.0.0/8        -j LOGGING-INBOUND
	iptables -A INPUT -d 0.0.0.0/8        -j LOGGING-INBOUND
	iptables -A INPUT -d 239.255.255.0/24 -j LOGGING-INBOUND
	iptables -A INPUT -d 255.255.255.255  -j LOGGING-INBOUND

#Specific Protocols
    #Steam (Bidirectional)
    iptables -A OUTPUT -p udp --dport 27000:27015 -j ACCEPT
    iptables -A OUTPUT -p udp --dport 27015:27030 -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 27014:27050 -j ACCEPT
    iptables -A OUTPUT -p udp --dport 3478 -j ACCEPT
    iptables -A OUTPUT -p udp --dport 4379 -j ACCEPT
    iptables -A OUTPUT -p udp --dport 4380 -j ACCEPT
    iptables -A OUTPUT -p udp --dport 4380 -j ACCEPT

    #HTTP (Outgoing only)
	iptables -A OUTPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
	iptables -A INPUT  -p tcp --sport 80 -m state --state ESTABLISHED     -j ACCEPT

	#HTTP-Alt (Outgoing only)
	iptables -A OUTPUT -p tcp --dport 8080 -m state --state NEW,ESTABLISHED -j ACCEPT
	iptables -A INPUT  -p tcp --sport 8080 -m state --state ESTABLISHED     -j ACCEPT


	#SSH (Outgoing only)
	iptables -A OUTPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
	iptables -A INPUT  -p tcp --sport 22 -m state --state ESTABLISHED     -j ACCEPT

	#HTTPS (Outgoing only)
	iptables -A OUTPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
	iptables -A INPUT  -p tcp --sport 443 -m state --state ESTABLISHED     -j ACCEPT

	#IRC (Outgoing only)
	iptables -A OUTPUT -p tcp --dport 6667 -m state --state NEW,ESTABLISHED -j ACCEPT
	iptables -A INPUT  -p tcp --sport 6667 -m state --state ESTABLISHED     -j ACCEPT

	#ICMP Ping (Outgoing only)
	iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
	iptables -A INPUT  -p icmp --icmp-type echo-reply   -j ACCEPT

	#DNS (Bidirectional)
	iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
	iptables -A INPUT  -p udp --sport 53 -j ACCEPT

#Logging
	iptables -A INPUT -j LOGGING-INBOUND
	iptables -A LOGGING-INBOUND  -m limit --limit 2/min -j LOG --log-prefix "IPTables Inbound Packet Dropped: " --log-level 7
	iptables -A LOGGING-INBOUND -j DROP


	iptables -A OUTPUT -j LOGGING-OUTBOUND
	iptables -A LOGGING-OUTBOUND -m limit --limit 2/min -j LOG --log-prefix "IPTables Outbound Packet Dropped: " --log-level 7
	iptables -A LOGGING-OUTBOUND -j DROP

---
categories:
  - Linux基础
  - 命令详细用法
  - 网络测试
title: Nping
tags:
  - 运维
  - linux
  - 网络安全
date:
updated:
---

Usage: nping [Probe mode] [Options] {target specification}

TARGET SPECIFICATION: Targets may be specified as hostnames, IP addresses, networks, etc. Ex: scanme.nmap.org, microsoft.com/24, 192.168.0.1; 10.0.*.1-24 PROBE MODES: --tcp-connect : Unprivileged TCP connect probe mode. --tcp : TCP probe mode. --udp : UDP probe mode. --icmp : ICMP probe mode. --arp : ARP/RARP probe mode. --tr, --traceroute : Traceroute mode (can only be used with TCP/UDP/ICMP modes). TCP CONNECT MODE: -p, --dest-port : Set destination port(s). -g, --source-port : Try to use a custom source port. TCP PROBE MODE: -g, --source-port : Set source port. -p, --dest-port : Set destination port(s). --seq : Set sequence number. --flags : Set TCP flags (ACK,PSH,RST,SYN,FIN...) --ack : Set ACK number. --win : Set window size. --badsum : Use a random invalid checksum. UDP PROBE MODE: -g, --source-port : Set source port. -p, --dest-port : Set destination port(s). --badsum : Use a random invalid checksum. ICMP PROBE MODE: --icmp-type : ICMP type. --icmp-code `: ICMP code. --icmp-id : Set identifier. --icmp-seq : Set sequence number. --icmp-redirect-addr : Set redirect address. --icmp-param-pointer : Set parameter problem pointer. --icmp-advert-lifetime : Set router advertisement lifetime. --icmp-advert-entry : Add router advertisement entry. --icmp-orig-time : Set originate timestamp. --icmp-recv-time : Set receive timestamp. --icmp-trans-time : Set transmit timestamp. ARP/RARP PROBE MODE: --arp-type : Type: ARP, ARP-reply, RARP, RARP-reply. --arp-sender-mac : Set sender MAC address. --arp-sender-ip : Set sender IP address. --arp-target-mac : Set target MAC address. --arp-target-ip : Set target IP address. IPv4 OPTIONS: -S, --source-ip : Set source IP address. --dest-ip : Set destination IP address (used as an alternative to {target specification} ). --tos : Set type of service field (8bits). --id : Set identification field (16 bits). --df : Set Donot Fragment flag. --mf : Set More Fragments flag. --evil : Set Reserved / Evil flag. --ttl : Set time to live [0-255]. --badsum-ip : Use a random invalid checksum. --ip-options : Set IP options --ip-options : Set IP options --mtu : Set MTU. Packets get fragmented if MTU is small enough. IPv6 OPTIONS: -6, --IPv6 : Use IP version 6. --dest-ip : Set destination IP address (used as an alternative to {target specification}). --hop-limit : Set hop limit (same as IPv4 TTL). --traffic-class : : Set traffic class. --flow : Set flow label. ETHERNET OPTIONS: --dest-mac : Set destination mac address. (Disables ARP resolution) --source-mac : Set source MAC address. --ether-type : Set EtherType value. PAYLOAD OPTIONS: --data : Include a custom payload. --data-string`

`   SEE THE MAN PAGE FOR MANY MORE OPTIONS, DESCRIPTIONS, AND EXAMPLES   `
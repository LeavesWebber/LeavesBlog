---
categories:
  - Linux基础
  - 命令详细用法
  - 网络测试
title: fping
tags:
  - 运维
  - linux
  - 网络安全
date:
updated:
---

Usage: fping <host(-list)> [-t time] [-w timeout] [-c] [-n count] [-s data_size] [-S size1/size2] [-R min/max] [-d ping_data] [-h TTL] [-v TOS] [-r routes] [-f] [-j] [-g host1/host2] [-H filename] [-a] [-A] [-p(x)] [-i] [-b(-)] [-T] [-D] [-l] [-o] [-L filename]

Options: -x : 检查可达主机数是否达到参数要求 #该特性仅在fping v4后可用 -t : time between 2 pings in ms up to 1000000 -w : timeout in ms to wait for each reply -c : continuous ping (higher priority than -n) to see statistics and continue - type Control-Break; to stop - type Control-C. -n : number of pings to send to each host -s : amount of data in bytes up to 65500 -S : size sweep: ping with size1, size1 + 1, ..., size2 bytes -R : random length between min and max (disabled when using -S) -d : ping with specified data -h : number of hops (TTL: 1 to 128) + print hops -v : Type Of Service (0 to 255) (IPv4-only) -r : record route (1 to 9 routes) (IPv4-only) -f : 'set Don't Fragment flag in packet (IPv4-only) -j : print jitter with each reply (only when pinging one host) -g : ping IP range from host1 to host2 (IPv4-only) -H : get hosts from filename (comma delimited, filename with full path) -a : resolve addresses to hostnames -A : print addresses with each reply -p : use a thread pool to ping multiple hosts (enables ICMP dll) x is optional and allows you to choose the number of threads e.g. -p uses a thread for every host -p5 uses a pool of 5 threads/core -i : use ICMP dll instead of raw socket (disables -r) -b : beep on every successful reply (-b- to beep on timeout) -T : print timestamp with each reply -D : print datestamp with each reply -l : limit the output to ping results and errors -o : limit the output to ping statistics -L : logging to a text file
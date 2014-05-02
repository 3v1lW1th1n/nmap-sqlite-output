nmap-sqlite
===========

This nmap script stores the following nmap output into a sqlite3 database: Hostname, IP, port number, protocol (tcp/udp), service and version.

Both, database file name and table name can be passed to the script via arguments (see @args or @example), data will always be appended to an existing table. Non-existant database files or tables are created during the scan. Nmap's regular output (-o) will not be modified in any way.


usage 
=====
```
nmap --script sqlite-output <target>
```

example
=======
```
$ nmap -sS -A -F --script sqlite-output --script-args=dbname=scan.sqlite,dbtable=scandata scanme.nmap.org
$ sqlite3 scan.sqlite
sqlite> select * from scandata;
scanme.nmap.org|74.207.244.221|22|tcp|ssh|OpenSSH5.3p1 Debian 3ubuntu7.1
scanme.nmap.org|74.207.244.221|80|tcp|http|Apache httpd2.2.14
```

args
=====
```
dbname:  name of sqlite database file (default: scan.sqlite)
dbtable: name of database table in which the output will be written (default: scandata)
```

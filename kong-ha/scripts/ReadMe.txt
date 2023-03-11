1. aws-simple-failover-setup-using-elastic-ip.py will switch the elastic-ip from one ec2-intance to another
2. we have used  base64 encode for passing aws credentials to this script for security purpose so that one cannot miss use with it.
3. We have used boto aws-sdk for making connection with aws console features. 
4. Also yaml libaray for reading configuration file.
5. This script will trigger by the keepalive where it found listening instance is down, then this script switch listening eslatic ip to backup instance.  
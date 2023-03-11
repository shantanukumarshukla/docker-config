import boto.ec2
import base64
import yaml
import os


my_path = os.path.abspath(os.path.dirname(__file__))
file = yaml.safe_load(open(os.path.join(my_path, "config\\" + "config.yaml")))

key_aws = file['key']
secret_aws = file['sceret_key']
public_ip = file['publi_ip']
ec_instance = file['ec2_instance']
ec_instance_2 = file['ec2_instancec']

key = base64.b64decode(key_aws).decode("utf-8", "ignore")
secret = base64.b64decode(secret_aws).decode("utf-8", "ignore")
elastic_ip = base64.b64decode(key_aws).decode("utf-8", "ignore")
ec2_id = base64.b64decode(ec_instance).decode("utf-8", "ignore")
ec2_id_2 = base64.b64decode(ec_instance_2).decode("utf-8", "ignore")

conn = boto.ec2.connect_to_region("ap-south-1", aws_access_key_id=key, aws_secret_access_key=secret)
addresses = conn.get_all_addresses()

try:
    for addr in addresses:
        print(addr)
        if addr.public_ip in elastic_ip:
            if addr.instance_id in ec2_id:
                asso = conn.associate_address(instance_id=ec2_id_2, public_ip=elastic_ip)
                if asso == True:
                    print("{} ip is assigned to {} instance".format(elastic_ip,ec2_id_2))
            else:
                asso = conn.associate_address(instance_id=ec2_id, public_ip=elastic_ip)
                if asso == True:
                    print("{} is now assigned to {} instance".format(elastic_ip, ec2_id))

except Exception as e:
    print('AWS is not reachable')
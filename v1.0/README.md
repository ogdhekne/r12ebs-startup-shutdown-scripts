## Scripts for Oracle E-Business Suite ; This script is tested for R12.1.1

###For Usage:

### Copy v1.1 to /usr/local/bin/
cp -r r12ebs/v1.1/ /usr/local/bin/

### Provide executable file-permissions:
chmod -R +x /usr/local/bin/v1.1/

### Create softlink of v1.1/ebs11 to /usr/local/bin/
ln -s /usr/local/bin/v1.1/ebs11 /usr/local/bin/ebs

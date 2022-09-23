amazon-linux-extras install epel -y
amazon-linux-extras installjava-openjdk11 -y
amazon-linux-extras install java-openjdk11 -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
  sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
  yum install jenkins -y
systemctl start jenkins
cat /var/lib/jenkins/secrets/initialAdminPassword
yum install git -y
aws configure
aws s3 ls
git clone https://github.com/pravansai/script.git
ls
cd script/
ls
cd script
ls
ll
cd ..
rm -rf script/
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
/usr/local/bin/aws --version
git clone https://github.com/pravansai/script.git
ls
cd script/
ls
cd ..
rm -rf script/
ls
vi pro.sh
chmod 777 pro.sh 
./pro.sh backup
yum install jq -y
./pro.sh backup
./pro.sh delete
git init
git confit --global-edit
git confit --global--edit
git confit --global --edit
git confit --global -edit
git config --global -edit
git config --global --edit
git add pro.sh 
git commit -m "first pro"
git remote add origin https://github.com/pravansai/pro.git
git push origin master
ls
pwd
ls -l
vi ebs.sh
chmod +x ebs.sh
./ebs.sh backup
./ebs.sh delete
git add ebs.sh 
git commit -m "ebs"
git push origin master
vi snap.sh
chmod +x snap.sh 
./ebs.sh backup
./snap.sh snap-09227a92626185cf5
./snap.sh
vi snap.sh
aws ec2 describe-snapshots --filter "Name=storage-tier,Values=archive"
aws ec2 describe-snapshots --filter "Name=storage-tier,Values=archive" | jq .Snapshots[].SnapshotId | sed 's/\"//g'`
aws ec2 describe-snapshots
./ebs.sh delete
./pro.sh backup
./pro.sh delete
systemctl start jenkins

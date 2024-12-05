Here are the commands:

    Install Java:

    bash

sudo apt update
sudo apt install openjdk-11-jdk

Verify Java Installation:

bash

java -version

Import the JFrog public GPG key:

bash

wget -qO - https://releases.jfrog.io/artifactory/api/gpg/key/public | sudo gpg --dearmor -o /usr/share/keyrings/jfrog.gpg

Add the JFrog Debian repository:

bash

echo "deb [signed-by=/usr/share/keyrings/jfrog.gpg] https://releases.jfrog.io/artifactory/artifactory-debs focal main" | sudo tee /etc/apt/sources.list.d/jfrog.list > /dev/null

Note: The above command assumes the Ubuntu version is 22.04 (focal). If using a different version, replace "focal" with the appropriate codename.

Update the package list:

bash

sudo apt update

Install JFrog Artifactory OSS:

bash

sudo apt install jfrog-artifactory-oss

Start JFrog Artifactory service:

bash

sudo systemctl start artifactory

Enable JFrog Artifactory to start on boot:

bash

sudo systemctl enable artifactory

Access JFrog Artifactory:
Once the installation is complete and the service is running, you can access JFrog Artifactory using your browser at http://localhost:8081/artifactory. The default login credentials are admin for both the username and password. Make sure to change the password after the first login.

2 . Binary Method

    3  apt update -y
    4  apt install openjdk-8-jdk -y
    5  sudo wget https://jfrog.bintray.com/artifactory/jfrog-artifactory-oss-6.9.6.zip
    6  apt install unzip -y
    7  unzip -o jfrog-artifactory-oss-6.9.6.zip -d /opt/
    8  ./bin/artifactory-oss-6.9.6
    9  cd /opt/artifactory-oss-6.9.6
   10  ls
   11  cd bin
   12  ls
   13  .artifactory.sh start
   14  ./artifactory.sh sta


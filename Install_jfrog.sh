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

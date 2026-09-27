#! /bin/bash
cd /opt/
set -e  #If any command fails, immediately stop the script
#Sets the HTTP User-Agent to look like a normal browser
curl -fL -A "Mozilla/5.0" -o /opt/sonarqube-26.9.0.129388.zip "https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-26.9.0.129388.zip"
unzip -o sonarqube-26.9.0.129388.zip
 dnf install java-21-amazon-corretto -y
id sonar &>/dev/null || useradd sonar   #If sonar exists → do nothing. If sonar doesn't exist → create it.
chown -R sonar:sonar /opt/sonarqube-26.9.0.129388     #So the SonarQube files become owned
chmod +x /opt/sonarqube-26.9.0.129388/bin/linux-x86-64/sonar.sh    #Add execute permission.
su - sonar -c "/opt/sonarqube-26.9.0.129388/bin/linux-x86-64/sonar.sh start"
# use the below command manually after installation
#sh /opt/sonarqube-26.9.0.129388/bin/linux-x86-64/sonar.sh start
#echo "user=admin & password=admin"

# use the below command manually after installation

#echo "user=admin & password=admin"

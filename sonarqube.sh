#! /bin/bash
cd /opt/
set -e  #If any command fails, immediately stop the script

curl -fL -A "Mozilla/5.0" \    #Sets the HTTP User-Agent to look like a normal browser
-o /opt/sonarqube-26.9.0.129388.zip \
"https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-26.9.0.129388.zip"
cd /opt
unzip -o sonarqube-26.9.0.129388.zip
 dnf install java-17-amazon-corretto -y
id sonar &>/dev/null || useradd sonar   #If sonar exists → do nothing. If sonar doesn't exist → create it.
chown -R sonar:sonar /opt/sonarqube-26.9.0.129388     #So the SonarQube files become owned
chmod +x /opt/sonarqube-26.9.0.129388/bin/linux-x86-64/sonar.sh    #Add execute permission.
su - sonar -c "/opt/sonarqube-26.9.0.129388/bin/linux-x86-64/sonar.sh start"
# use the below command manually after installation
#sh /opt/sonarqube-26.9.0.129388/bin/linux-x86-64/sonar.sh start
#echo "user=admin & password=admin"

# use the below command manually after installation
#sh /opt/sonarqube-8.9.6.50800/bin/linux-x86-64/sonar.sh start
#echo "user=admin & password=admin"

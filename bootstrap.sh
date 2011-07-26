#!/bin/bash -xe

{% autoescape off %}

# Schedule a shutdown in 50 minutes to be on the safe side
shutdown -h +50 &

mkdir -p /tmp/cisetup
cd /tmp/cisetup
apt-get -y install curl

# Get the setup script, git PKs etc
curl --insecure "{{ web_host_protocol }}://{{ web_host }}/buildservices/build/{{ build.id }}/bundle/?secret={{ build_instance.secret }}" | tar -zx

export CI_USER="ci"

# Create the user and allow them to sudo
useradd -U -m -d /home/$CI_USER -s /bin/bash $CI_USER
echo "$CI_USER  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# These settings can be overridden in a .continuousrc file 
# within your project's root directory.
echo 'TIMEZONE="UTC"
CI_USER="ci"
GIT_URI="{{ build.project.git_uri }}"
GIT_PK_FILE="git.pk"
GIT_BRANCH="{{ build.branch.name }}"
BUILD_ID="{{ build.id }}"
BUILD_SECRET="{{ build.build_instance.secret }}"
BUNDLE_ROOT_URL="{{ web_host_protocol }}://{{ web_host }}"
' >> /home/$CI_USER/.bash_profile

chown $CI_USER:$CI_USER /home/$CI_USER/.bash_profile

# Start the setup and save all output to a log file
chmod 755 /tmp/cisetup/startup_script
touch /var/log/continuous.log
chown $CI_USER:$CI_USER /var/log/continuous.log

rm -f /tmp/passed

su -c "/tmp/cisetup/startup_script 2>&1 | tee /var/log/continuous.log | nc -w 600 {{ receiver_host }} 8002" - $CI_USER

if [ ! -f /tmp/passed ]; then
    echo "Setup script failed"
    curl -d "status=dead&secret={{ build_instance.secret }}" "{{ web_host_protocol }}://{{ web_host }}/buildservices/build/{{ build.id }}/update-status/"
fi

# Send the log back to continuous
curl --data-binary @/var/log/continuous.log "{{ web_host_protocol }}://{{ web_host }}/buildservices/build/{{ build.id }}/script-output/?secret={{ build_instance.secret }}"

# Shutdown the server in a few minutes
# (allows for login if necessary)
shutdown -c || true
shutdown -h +3 & 

{% endautoescape %}
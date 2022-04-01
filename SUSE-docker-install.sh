# SUSE install docker

#sudo zypper addrepo https://download.opensuse.org/repositories/editors/SLE_15/editors.repo
#sudo zypper refresh -a 
#sudo zypper install -y nano

# some of these commands need arguments added to them to run without human intervention.


sudo zypper update -y

# Remove any existing Docker artifacts
sudo zypper remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine \
                  runc


# Install docker, containerd
sudo SUSEConnect -p sle-module-containers/15.3/x86_64
sudo zypper install docker
sudo systemctl enable docker.service

# Install docker-compose
#sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose
#sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker $USER
# exit and restart shell with new user group
exec sudo su -l $USER


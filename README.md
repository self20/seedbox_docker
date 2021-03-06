# seedbox_docker

## Description :
This script automatically install some services to any debian based distro using docker and docker-compose.
I made a start page to get an easy access to all installed apps at `http://<your-ip>`

**Downloaders :**
- [rTorrent](https://github.com/rakshasa/rtorrent) : **Torrents** downloader with a modern web UI ( [Flood](https://github.com/jfurrow/flood) ). Dockerized by [Wonderfall](https://github.com/Wonderfall/dockerfiles/tree/master/rtorrent-flood).
- [SabNZB](https://sabnzbd.org/) : **Newsgroups** downloader dockerized by [linuxserver.io](https://github.com/linuxserver/docker-sabnzbd).
- Pyload : **direct download** not yet implemented. Still looking for a good maintainer.

**Download automation :**
- [Radarr](https://github.com/Radarr/Radarr) : Automated **movies** downloader dockerized by [linuxserver.io](https://github.com/linuxserver/docker-headphones).
- [SickGear](https://github.com/SickGear/SickGear) : Automated **TV Shows** downloader dockerized by [ressu](https://github.com/SickGear/SickGear.Docker).
- [Headphones](https://github.com/rembo10/headphones) : Automated **music** downloader dockerized by [linuxserver.io](https://github.com/linuxserver/docker-headphones).
- [Mylar](https://github.com/evilhero/mylar) : Automated **comic book** (cbr/cbz) downloader dockerized by [linuxserver.io](https://github.com/linuxserver/docker-mylar).  

**Streaming :**
- [Emby](https://emby.media/) : Video streaming platform dockerized by [Emby.media](https://hub.docker.com/r/emby/embyserver/).
- [Ubooquity](https://vaemendis.net/ubooquity/) : Comics streaming platform dockerized by [Cromigon](https://github.com/cromigon/ubooquity-docker).
- [Libresonic](https://github.com/Libresonic/libresonic) : Music streaming platform dockerized by [linuxserver.io](https://github.com/linuxserver/docker-libresonic)

**Tools :**
- Start Menu : Self-made srart page to centralize links to each app on the same interface. Access it through `http://<your-ip>` 
- [HTPC Manager](https://github.com/Hellowlol/HTPC-Manager) : Front-end interface to manage many htpc related applications dockerized by [linuxserver.io](https://github.com/linuxserver/docker-htpcmanager).
- [Watchtower](https://github.com/v2tec/watchtower) : **docker tool** that check and update all other containers automaticaly.
- [Portainer](https://github.com/portainer/portainer) : **docker tool** that adds a graphical web interface to manage all containers.

## How to use this script :
1- Clone this repository :  
`git clone https://github.com/zerpex/seedbox_docker.git seedbox`

2- Place yourself on the folder :  
`cd seedbox`

2b- OPTIONNAL  
- Container's names and exposed ports are set in var.sh fell free to change them as you like/need :) (just remember that these elements are needeed to be uniq).
- (_only if you know what you are doing !_) : You can change all docker options in `./files/samples/*.docker` where "*" is the app you want to change.

3- Execute :  
`./seedbox_docker.sh`

4- Answer questions :)

## Notes :
- If not found, it will **automatically** install docker and docker-compose
- Default dirs set to /home/seedbox
- All apps are centralized in one page : `http://<your-ip>`
  If you don't want to use it, you can still access apps through :

**rTorrent** : `http://<your-ip>:5001`  
 user and pass will be asked at first start

**SabNZB** : `http://<your-ip>:5002`  
 user and pass will be asked at first start

**Emby** : `http://<your-ip>:5200`  
 user and pass will be asked at first start

**Ubooquity** : `http://<your-ip>:5201`  
 Admin interface is availlable at `htpp://<your-ip>:5201/admin`  
 user and pass will be set on the admin interface on first start.

**Libresonic** : `http://<your-ip>:5202`  
 user : admin / pass : admin

**Radarr** : `http://<your-ip>:5101`

**SickGear** : `http://<your-ip>:5102`

**Headphones** : `http://<your-ip>:5103`

**Mylar** : `http://<your-ip>:5104`

**HTPC Manager** : `http://<your-ip>:5555`

**Portainer** : `http://<your-ip>:9000`

## To do :
- Add a reverse proxy
- Adds Pyload

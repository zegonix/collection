# docker

- [start docker service](#start-docker-service)


## start docker service

To start the docker service, use `systemctl`:
```bash
sudo systemctl start docker
```
If you want the docker service to be started at boot, use:
```bash
sudo systemctl enable --now docker
```

# JupyterLab on docker
- JupyterLab on docker that solves the UID/GID problem that occurs on a Linux host.

## Usage
- All you need to do is to run the following command for the first time.
```
$ eval "echo \"$(cat .id.env.example)\"" > .id.env
```
- Then, you can run the container as usual.
```
$ docker-compose up
```


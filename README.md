# Usage with docker-compose

```
version: '3'

services:

    builder:
        tty: true
        image: trakiss/docker-boost:latest
        working_dir: /agent
        volumes:
            - ./:/agent
        cap_add:
            - SYS_PTRACE
        security_opt:
            - apparmor:unconfined
```

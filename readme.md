# 개요
- 도커 스웜을 활용한 라라벨 배포

# 개발 도커설치
```
$ curl -sSL https://get.docker.com/ | sh
$ apt-get install -y python-pip
$ pip install docker-compose
```

# 개발
```
생성 : docker-compose -f docker-compose.dev.yml up --build -d
삭제 : docker-compose -f docker-compose.dev.yml down
```

# 라이브 초기 셋팅
```
docker swarm init (출력내용을 다른 호스트에서 실행하여 swarm join)
docker stack deploy -c docker-compose.live.yml --with-registry-auth laravel
```

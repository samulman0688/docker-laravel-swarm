# 개요
- 도커 스웜을 활용한 라라벨 배포

# 개발 도커설치
```
$ curl -sSL https://get.docker.com/ | sh
$ apt-get install -y python-pip
$ pip install docker-compose
```

# 개발 셋팅
```
생성 : docker-compose -f docker-compose.dev.yml up --build -d
삭제 : docker-compose -f docker-compose.dev.yml down
```

# 라이브 초기 셋팅
```
manager AMI : ami-7ffb2411 (docker php)
worker  AMI : ami-3a03dc54 (docker stable)

sudo apt-get install -y python-pip && pip install docker-compose

git clone https://github.com/samulman0688/docker-laravel-swarm.git
디렉토리 이동후 cp .env.example .env && composer install && php artisan key:generate

docker login
docker-compose -f docker-compose.live.yml build
docker-compose -f docker-compose.live.yml push

docker swarm init (출력내용을 다른 호스트에서 실행하여 swarm join)
docker stack deploy -c docker-compose.live.yml --with-registry-auth laravel
```

# 라이브 롤링 업데이트
```
docker-compose -f docker-compose.live.yml build php
docker-compose -f docker-compose.live.yml push php
docker service update --image samulman0688/laravel-app --detach=false laravel_php
```

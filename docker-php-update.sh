#!/bin/bash
docker-compose -f docker-compose.live.yml build php
docker-compose -f docker-compose.live.yml push php
docker service update --image samulman0688/laravel-app --detach=false laravel_php

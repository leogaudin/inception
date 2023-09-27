# Colors
GREEN = \033[0;32m
RED = \033[0;31m
RESET = \033[0m

COMPOSE=./srcs/docker-compose.yml

up:
	@mkdir -p data/wordpress data/mariadb
	@docker-compose -f $(COMPOSE) up -d --build
	@echo "$(GREEN)Containers are up and running.$(RESET)"

down:
	@docker-compose -f $(COMPOSE) down -v
	@echo "$(RED)Containers are down.$(RESET)"

stop:
	@docker-compose -f $(COMPOSE) stop
	@echo "$(RED)Containers are stopped.$(RESET)"

clean:
	@rm -rf data/

re: down up

rec: down clean up

.PHONY: up down stop clean re

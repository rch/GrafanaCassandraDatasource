UNAME := $(shell uname)

ifeq ($(UNAME), Darwin)
ARCH := darwin_amd64
else
ARCH := linux_amd64
endif
 
.PHONY: all
all: backend frontend

.PHONY: clean
clean:
	rm -drf dist

.PHONY: backend
backend:
	@ mkdir -p dist
	go build -o ./dist/cassandra-plugin_$(ARCH)  ./backend

.PHONY: frontend
frontend:
	npx webpack

.PHONY: install
install: all
	@ cp -R ./dist /usr/local/var/lib/grafana/plugins/cassandra-datasource


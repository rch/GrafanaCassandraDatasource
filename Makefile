.PHONY: all
all: backend frontend

.PHONY: clean
clean:
	rm -drf dist

.PHONY: backend
backend:
	@ mkdir -p dist
	go build -o dist ./...

.PHONY: frontend
frontend:
	npx webpack


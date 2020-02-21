.PHONY: all
all:docker 

.PHONY: submodule
submodule:
	git submodule init && git submodule update

.PHONY: docker
docker: submodule
	docker build -t textmode .

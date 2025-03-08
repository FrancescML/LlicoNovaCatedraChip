build: build-index build-python build-cpp build-terminal

build-index:
	(cd index ; bun run build)

build-python:
	(cd python ; bun run build)

build-cpp:
	(cd cpp ; bun run build)

build-terminal:
	(cd terminal ; bun run build)

publish:
	rm -rf dist dist.tar.gz
	cp -r index/.vitepress/dist dist
	cp -r python/.vitepress/dist dist/python
	cp -r cpp/.vitepress/dist dist/cpp
	cp -r terminal/.vitepress/dist dist/terminal
	tar czf dist.tar.gz dist
	scp dist.tar.gz llicons@llicons.jutge.org:
	ssh llicons@llicons.jutge.org "tar xf dist.tar.gz"
	ssh llicons@llicons.jutge.org "chmod -R a+rX dist"
	ssh llicons@llicons.jutge.org "rm -rf www"
	ssh llicons@llicons.jutge.org "mv dist www"
	rm -rf dist dist.tar.gz

publish-potipoti:
	ssh jpetit@cs "rm -rf www/llicons"
	scp -r index/.vitepress/dist jpetit@cs:www/llicons
	scp -r python/.vitepress/dist jpetit@cs:www/llicons/python
	scp -r cpp/.vitepress/dist jpetit@cs:www/llicons/cpp
	scp -r terminal/.vitepress/dist jpetit@cs:www/llicons/terminal
	ssh jpetit@cs "chmod -R a+rX www/llicons"

install:
	(cd index ; bun install)
	(cd python ; bun install)
	(cd cpp ; bun install)
	(cd terminal ; bun install)
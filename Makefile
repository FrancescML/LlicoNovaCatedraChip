build: build-index build-python build-cpp

build-index:
	(cd index ; bun run build)

build-python:
	(cd python ; bun run build)

build-cpp:
	(cd cpp ; bun run build)

publish:
	ssh jpetit@cs "rm -rf www/llicons"
	scp -r index/.vitepress/dist jpetit@cs:www/llicons
	scp -r python/.vitepress/dist jpetit@cs:www/llicons/python
	scp -r cpp/.vitepress/dist jpetit@cs:www/llicons/cpp
	ssh jpetit@cs "chmod -R a+rX www/llicons"

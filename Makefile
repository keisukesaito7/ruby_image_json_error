build_none:
	docker build -f ./Dockerfile.none -t ruby2_7_7_json_none .
run_none:
	docker run --rm -it -v `pwd`:/usr/src/app ruby2_7_7_json_none bash
build_alpine:
	docker build -f ./Dockerfile.alpine -t ruby2_7_7_json_alpine .
run_alpine:
	docker run --rm -it -v `pwd`:/usr/src/app ruby2_7_7_json_alpine sh
build_slim:
	docker build -f ./Dockerfile.slim -t ruby2_7_7_json_slim .
run_slim:
	docker run --rm -it -v `pwd`:/usr/src/app ruby2_7_7_json_slim bash

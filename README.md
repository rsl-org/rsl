# Build from source

In order to build from source you need to have compiler with c++26 reflection support.
We provide a docker image that you can use `ghcr.io/rsl-org/fedora_devcontainer`

It is encouraged to use this meta repository as one place that allows you to develop and try out different repositories from `rsl-org`

To compile any project you can do the following:

Get the source and initialize all submodules

``` sh
git clone https://github.com/rsl-org/rsl.git
cd rsl && git submodule init && git submodule update
```

Open the source code inside the docker image

``` sh
docker run --mount type=bind,source="$(pwd)",target=/src -it ghcr.io/rsl-org/fedora_devcontainer
```

run `enable_all.sh` script to add all projects in the conan workspace
``` sh
./projects/enable_all.sh
```

Add local recipies to find required dependencies
``` sh
cd /src/infra/conan && ./make.sh
```

Now you can compile project

``` sh
cd /src
conan build projects/test --build=missing -s build_type=Release
```

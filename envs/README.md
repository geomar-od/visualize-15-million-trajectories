# Jupyter kernels

## Miniconda environment

For admins,

```shell
$ cd <miniconda3-dir>
$ cp <github-repository-dir>/envs/* .
$ ls
environment.yml jupyter-kernel.sh ...
./jupyter-kernel.sh install
./jupyter-kernel.sh register
```

For users,

```shell
$ ./<miniconda3-dir>/jupyter-kernel.sh register
```


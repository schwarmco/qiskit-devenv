# Qiskit Development Environment

As i'm not a "Python Guy", i wanted to abstract away all the setup-stuff into Docker.

## Installation

The first step is to clone this repo with

```bash
git clone git@github.com:schwarmco/qiskit-devenv.git
cd qiskit-devenv
```

After that, i clone all my Qiskit-Forks into it:

```bash
git clone git@github.com:schwarmco/qiskit-terra.git
git clone git@github.com:schwarmco/qiskit-aer.git
git clone git@github.com:schwarmco/qiskit-ignis.git
git clone git@github.com:schwarmco/qiskit-aqua.git
git clone git@github.com:schwarmco/qiskit-ibmq-provider.git
```

Set the Upstream to the original repos

```bash
bash -c "cd qiskit-terra && git remote add upstream https://github.com/Qiskit/qiskit-terra.git"
bash -c "cd qiskit-aer && git remote add upstream https://github.com/Qiskit/qiskit-aer.git"
bash -c "cd qiskit-ignis && git remote add upstream https://github.com/Qiskit/qiskit-ignis.git"
bash -c "cd qiskit-aqua && git remote add upstream https://github.com/Qiskit/qiskit-aqua.git"
bash -c "cd qiskit-ibmq-provider && git remote add upstream https://github.com/Qiskit/qiskit-ibmq-provider.git"
```

Build the Docker Image, which mounts these Repositories as volumes:

```bash
docker build -t qiskit-devenv .
```

## Working with it

Spin up the Docker Container with

```bash
docker run -it -v $(pwd):/qiskit -p 8888:8888 qiskit-devenv
# or whichever thing you're working on. also multiple volumes are possible - like:
# docker run -it -v $(pwd)/qiskit-terra:/qiskit/qiskit-terra -v $(pwd)/qiskit-ignis:/qiskit/qiskit-ignis -p 8888:8888 qiskit-devenv
```
#!/bin/bash

# install terra
cd qiskit-terra
pip install cython
pip install -r requirements-dev.txt
pip install -e .

cd ..

# install aer
cd qiskit-aer
python ./setup.py bdist_wheel
cd dist
pip install qiskit_aer-*.whl

cd ..

# install ignis
cd qiskit-ignis
pip install -r requirements-dev.txt
pip install -e .

cd ..

# install aqua
cd qiskit-aqua
pip install -r requirements-dev.txt
pip install -e .

cd ..

# install ibm q provider
cd qiskit-ibmq-provider
pip install -r requirements-dev.txt
pip install -e .

# run jupyter
jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root
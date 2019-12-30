FROM python:3.7-buster

RUN apt update && apt install -q -y build-essential libopenblas-dev ninja-build python3-dev
RUN pip install cmake scikit-build cython pybind11

WORKDIR /qiskit

# terra
COPY qiskit-terra /qiskit/qiskit-terra
RUN cd qiskit-terra && pip install -r requirements-dev.txt && pip install -e . && cd ..

# aer
COPY qiskit-aer /qiskit/qiskit-aer
RUN cd qiskit-aer && python3 ./setup.py bdist_wheel && cd dist && pip install qiskit_aer-*.whl 
RUN cd ../..

# ignis
COPY qiskit-ignis /qiskit/qiskit-ignis
RUN cd qiskit-ignis && pip install -r requirements-dev.txt && pip install -e . && cd ..

# aqua
COPY qiskit-aqua /qiskit/qiskit-aqua
RUN cd qiskit-aqua && pip install -r requirements-dev.txt && pip install -e . && cd ..

# ibmq provider
COPY qiskit-ibmq-provider /qiskit/qiskit-ibmq-provider
RUN cd qiskit-ibmq-provider && pip install -r requirements-dev.txt && pip install -e . && cd ..

COPY entrypoint.sh /qiskit
ENTRYPOINT [ "/qiskit/entrypoint.sh" ]
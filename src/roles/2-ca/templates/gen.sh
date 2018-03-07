#!/bin/sh


cfssl gencert -initca /code/ca-csr.json | cfssljson -bare /code/ca && \
cfssl gencert -ca=/code/ca.pem -ca-key=/code/ca-key.pem -config=/code/ca-config.json -profile=kubernetes /code/etcd-csr.json | cfssljson -bare /code/etcd && \
cfssl gencert -ca=/code/ca.pem -ca-key=/code/ca-key.pem -config=/code/ca-config.json -profile=kubernetes /code/kubernetes-csr.json | cfssljson -bare /code/kubernetes && \
cfssl gencert -ca=/code/ca.pem -ca-key=/code/ca-key.pem -config=/code/ca-config.json -profile=kubernetes /code/kube-proxy-csr.json  | cfssljson -bare /code/kube-proxy && \
cfssl gencert -ca=/code/ca.pem -ca-key=/code/ca-key.pem -config=/code/ca-config.json -profile=kubernetes /code/admin-csr.json | cfssljson -bare /code/admin
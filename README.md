这是一个离线部署 k8s 的 ansible 脚本。

# 机器准备
1. deploy 机器准备，需要一台机器执行 ansible 脚本
2. k8s 机器准备，我当前测试过的机器为  centos 7.2 mini 64 bit
3. 部署的版本是 1.8.2 


# 执行脚本
1. 在 deploy 机器上安装 ansible，推荐使用 virtualenv 创建虚拟环境
2. 生成 ssh key 并拷贝到需要部署 k8s 的机器上
3. 修改 src/inventory/inventory.cfg 文件，写入的节点 IP， 以及对应的变量信息


# 部署

```bash
git clone https://github.com/recall704/Husky.git
cd Husky
git lfs install
git lfs pull
pip install -r requiredments.txt
cd src
ansible-playbook -i inventory/inventory.cfg cluster.yml -v
```

部署完成后，kubectl get node 查看是否部署成功。


TIPS:
1. 由于有个文件超过 github 100MB 大小的限制，使用了 github 的 LFS，所以机器上需要安装 [git-lfs][1]
2. 证书生成改为在 master 节点上，通过容器方式生成。



  [1]: https://git-lfs.github.com/

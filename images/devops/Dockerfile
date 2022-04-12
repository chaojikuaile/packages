FROM rockylinux:8.5.20220308

# docker build -t licunchang/devops:20412 .
# docker tag licunchang/devops:20412 licunchang/devops:latest
# docker push licunchang/devops:20412
# docker push licunchang/devops:latest

# docker tag licunchang/devops:latest registry.cn-zhangjiakou.aliyuncs.com/chaojikuaile/devops:latest
# docker push registry.cn-zhangjiakou.aliyuncs.com/chaojikuaile/devops:latest

LABEL org.opencontainers.image.source https://github.com/chaojikuaile/devops

ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PIP_NO_CACHE_DIR=1
ENV PS1="[\u@\h \W]\\$ "
ENV TZ=Asia/Shanghai

RUN dnf -y install epel-release \
    && dnf -y install python39 python39-pip rsync openssh-clients sshpass jq jsonnet findutils \
    && python3 -m pip install yamllint \
    && python3 -m pip install jsonschema \
    && python3 -m pip install netaddr \
    && python3 -m pip install fire \
    && python3 -m pip install ansible \
    && python3 -m pip install ansible-runner \
    && bash -c "rm -rf /usr/local/lib/python3.*/site-packages/ansible_collections/{amazon,arista,awx,azure,check_point,chocolatey,cisco,cloud,cloudscale_ch,cyberark,dellemc,f5networks,fortinet,frr,gluster,google,hetzner,hpe,ibm,infinidat,infoblox,inspur,junipernetworks,mellanox,netapp,netapp_eseries,netbox,ngine_io,openstack,openvswitch,ovirt,purestorage,sensu,servicenow,splunk,t_systems_mms,theforeman,vyos,wti,ansible/windows,community/aws,community/azure,community/ciscosmb,community/digitalocean,community/fortios,community/google,community/grafana,community/hashi_vault,community/hrobot,community/kubevirt,community/libvirt,community/mongodb,community/okd,community/postgresql,community/proxysql,community/rabbitmq,community/routeros,community/skydive,community/vmware,community/windows,community/zabbix}" \
    && dnf clean all

CMD ["/bin/bash"]

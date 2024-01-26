# https://takapi86.hatenablog.com/entry/2020/12/27/191235
FROM centos:7

RUN yum update -y \
  && yum install -y epel-release yum-plugin-priorities \
  && curl -o /etc/yum.repos.d/powerdns-auth-43.repo https://repo.powerdns.com/repo-files/centos-auth-43.repo \
  && yum install -y pdns \
  && rm -rf /var/cache/yum \
  && yum clean all
COPY ./pdns.conf /etc/pdns/pdns.conf

CMD ["/usr/sbin/pdns_server"]

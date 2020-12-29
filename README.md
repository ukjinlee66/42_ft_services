# 42_ft_services<br>

# Prohibited Contents<br>
Usage of Node Port services, Ingress Controller object or kubectl port-forward command is prohibited.<br>
Your Load Balancer should be the only entry point for the Cluster.<br>
<br>
# Mandatory list:<br>
- [x] The Kubernetes web dashboard. This will help you manage your cluster.<br>
- [x] The Load Balancer which manages the external access of your services. It will be the only entry point to your cluster. You must keep the ports associated with the service (IP:3000 for grafana etc). Load Balancer will have a single ip.<br>
- [x] A container with an nginx server listening on ports 80 and 443. Port 80 will be in http and should be a systematic redirection of type 301 to 443, which will be in https. The page displayed does not matter as lon as it is not an http error. This container will allow access to a /wordpress route that makes a redirect 307 to IP:WPPORT. it should also allow access to /phpmyadmin with a reverse proxy to IP:PMAPORT.<br>
- [ ] A FTPS server listening on port 21.<br>
- [x] A WordPress website listening on port 5050, which will work with a MySQL database. Both services have to run in separate containers. The WordPress website will have several users and an administrator. Wordpress needs its own nginx server. The Load Balancer should be able to redirect directly to this service.<br>
- [x] PhpMyAdmin, listening on port 5000 and linked with the MySQL database. Php-MyAdmin needs its own nginx server, The Load Balancer should be able to redirect directly to this service.<br>
- [ ] A Grafana platform, listening on port 3000, linked with an InfluxDB database. Grafana will be monitoring all your containers. You must create one dashboard per service. InfluxDB and grafana will be in two distincts containers.<br>
- [ ] In case of a crash or stop of one of the two database containers, you will have to make shure the data persist.<br>
- [x] You must be able to access the Nginx container by logging into SSH.<br>
- [x] All your containers must restart in case of a crash or stop of one of its component parts.<br><br>

# Important Note<br><br>
Make sure that each redirection toward a service is done using a load balancer. FTPS, Grafana, Wordpress, PhpMyAdmin and nginx’s kind must be "LoadBalancer". Influxdb and MySQL’s kind must be "ClusterIP". Other entries can be present, but none of them can be of kind "NodePort".<br>

# Reference sites<br><br>
- <https://kubernetes.io/ko/docs/concepts/overview/what-is-kubernetes/> - what is kubernetes?<br>
- <https://twofootdog.tistory.com/5?category=845779><br><br>
- <https://www.redhat.com/ko/topics/containers/what-is-a-kubernetes-cluster> - what is cluster?<br><br>
- <https://github.com/kubernetes/dashboard#kubernetes-dashboard> - The Kubernetes web dashboard. This will help you manage your cluster.<br><br>
- <https://www.inflearn.com/questions/16184> - What is a yaml file?<br><br>
- <https://elearning.vector.com/mod/page/view.php?id=2073> - What is ARP, NDP protocol?<br><br>
- <https://metallb.universe.tf/installation/> - set ARP protocol, MetalLB<br>
- <https://metallb.universe.tf/configuration/> - set MetalLB config.yaml file <br><br>
- <https://wiki.alpinelinux.org/wiki/Nginx> - set Nginx in Alpine Linux<br><br>
- <https://wiki.alpinelinux.org/wiki/FTP> - set FTP in Alpine Linux<br><br>
- <https://wiki.alpinelinux.org/wiki/PhpMyAdmin> - set phpmyadmin in Alpine Linux<br><br>
- <https://wiki.alpinelinux.org/wiki/WordPress> - set Wordpress in Alpine Linux<br><br>
- <https://bluese05.tistory.com/77> - Difference between entrypoint and cmd command in dockerfile.<br><br>
- <https://wiki.alpinelinux.org/wiki/Production_DataBases_:_mysql> - set mysql init<br>
- <https://velog.io/@pa324/쿠버네티스-mysql-설치-6bjxv4dcoa> - Installing mysql on Kubernetes.<br><br>
- <https://jasontody.tistory.com/113> - how to use "nohup"?<br><br>
- <https://medium.com/google-cloud/kubernetes-nodeport-vs-loadbalancer-vs-ingress-when-should-i-use-what-922f010849e0> - Nodeport, Ingress, Load Balancer differences. <br><br>
- <https://kubernetes.io/ko/docs/concepts/workloads/pods/pod-lifecycle/> - Pods life cycle. <br><br>
- <https://medium.com/humanscape-tech/nginx를-이용한-forward-proxy-구현-91f3555549be> - What is forward, backward Proxy? <br><br>
- <https://devconnected.com/how-to-install-influxdb-telegraf-and-grafana-on-docker/> - How To Install InfluxDB Telegraf and Grafana on Docker<br><br>

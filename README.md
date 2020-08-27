# 42_ft_services<br>

# Prohibited Contents<br>
Usage of Node Port services, Ingress Controller object or kubectl port-forward command is prohibited.<br>
Your Load Balancer should be the only entry point for the Cluster.<br>
<br>
# Mandatory list:<br>
- [x] The Kubernetes web dashboard. This will help you manage your cluster.<br>
- [x] The Load Balancer which manages the external access of your services. It will be the only entry point to your cluster. You must keep the ports associated with the service (IP:3000 for grafana etc).<br>
- [x] A Nginx server listening on ports 80 and 443. Port 80 will be in http and should be a systematic redirection of type 301 to 443, which will be in https. The page displayed does not matter.<br>
- [ ] A FTPS server listening on port 21.<br>
- [ ] A WordPress website listening on port 5050, which will work with a MySQL database. Both services have to run in separate containers. The WordPress website will have several users and an administrator.<br>
- [ ] PhpMyAdmin, listening on port 5000 and linked with the MySQL database.<br>
- [ ] A Grafana platform, listening on port 3000, linked with an InfluxDB database. Grafana will be monitoring all your containers. You must create one dashboard per service. InfluxDB and grafana will be in two distincts containers.<br>
- [ ] In case of a crash or stop of one of the two database containers, you will have to make shure the data persist.<br>
- [ ] You must be able to access the Nginx container by logging into SSH.<br>
- [ ] All your containers must restart in case of a crash or stop of one of its component parts.<br><br>
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
- <https://bluese05.tistory.com/77> - Difference between entrypoint and cmd command in dockerfile.<br><br>
- <https://velog.io/@pa324/쿠버네티스-mysql-설치-6bjxv4dcoa> - Installing mysql on Kubernetes.<br><br>

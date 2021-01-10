# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: youlee <youlee@student.42seoul.kr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/18 17:30:53 by youlee            #+#    #+#              #
#    Updated: 2021/01/10 15:18:41 by youlee           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash
export MINIKUBE_HOME=/Users/youlee/goinfre
echo -e "\033[32m==========================================================================\033[0m"
 echo -e "\033[36m"SETUP.SH START"\033[0m"
echo -e "\033[32m"=========================================================================="\033[0m"
echo -e "\033[31m"Minikube start"\033[0m"
minikube --vm-driver=virtualbox start --extra-config=apiserver.service-node-port-range=1-35000
echo -e "\033[32m"=========================================================================="\033[0m"


echo -e "\033[31m"set kubenets set ARP protocol"\033[0m"
# echo "see what changes would be made, returns nonzero returncode if different"
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl diff -f - -n kube-system
# echo "actully apply the changes, returns nonzero returncode on errors only"
#kubectl get configmap kube-proxy -n kube-system -o yaml | \
#sed -e "s/strictARP: false/strictARP: true/" | \
#kubectl diff -f - -n kube-system
echo -e "\033[32m"=========================================================================="\033[0m"

eval $(minikube docker-env)

echo -e "\033[31m"All necesary docker files are imported."\033[0m"
docker build --tag nginxx ./srcs/nginx/
docker build --tag mysqll ./srcs/MySQL/
docker build --tag wordpresss ./srcs/WordPress/
docker build --tag phpmyadminn ./srcs/PhpMyAdmin/
docker build --tag influxdbb ./srcs/InfluxDB/
docker build --tag grafanaa ./srcs/Grafana/
docker build --tag telegraff ./srcs/Telegraf/
docker build --tag vsftpdd ./srcs/FTPS/
echo -e "\033[32m"=========================================================================="\033[0m"
echo -e "\033[31m"set MetalLB manifest"\033[0m"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
echo -e "\033[32m"=========================================================================="\033[0m"
echo -e "\033[31m"check MetalLB system"\033[0m"
kubectl get all -n metallb-system
echo -e "\033[32m"=========================================================================="\033[0m"
echo -e "\033[31m"apply Metal LB config.yaml file!"\033[0m"
kubectl apply -f srcs/MetalLB/config.yaml
echo -e "\033[31m"Check External IP"\033[0m"
kubectl get svc
echo -e "\033[32m"=========================================================================="\033[0m"
echo -e "\033[31m"Set all yaml files."\033[0m"
kubectl apply -f srcs/accounts.yaml
kubectl apply -f srcs/MySQL/mysql.yaml
kubectl apply -f srcs/PhpMyAdmin/phpmyadmin.yaml
kubectl apply -f srcs/WordPress/wordpress.yaml
kubectl apply -f srcs/nginx/my-nginx.yaml
kubectl apply -f srcs/Telegraf/telegraf.yaml
kubectl apply -f srcs/InfluxDB/influxdb.yaml
kubectl apply -f srcs/Grafana/grafana.yaml
kubectl apply -f srcs/FTPS/FTPS.yaml
echo -e "\033[32m"=========================================================================="\033[0m"
echo -e "\033[36m"SETUP.SH END"\033[0m"
echo -e "\033[32m"=========================================================================="\033[0m"
minikube dashboard

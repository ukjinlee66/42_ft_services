# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: youlee <youlee@student.42seoul.kr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/18 17:30:53 by youlee            #+#    #+#              #
#    Updated: 2020/08/22 18:58:32 by youlee           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

 echo -e "\033[32m"=========================================================================="\033[0m"
 echo -e "\033[36m"SETUP.SH START"\033[0m"
echo -e "\033[32m"=========================================================================="\033[0m"
echo -e "\033[31m"set web dashborad"\033[0m"
echo -e "\033[32m"=========================================================================="\033[0m"
echo -e "\033[31m"set kubenets set ARP protocol"\033[0m"
# echo "see what changes would be made, returns nonzero returncode if different"
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl diff -f - -n kube-system
# echo "actully apply the changes, returns nonzero returncode on errors only"
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl diff -f - -n kube-system
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
echo -e "\033[31m"apply config.yaml file!"\033[0m"
kubectl apply -f srcs/MetalLB/config.yaml
echo -e "\033[32m"=========================================================================="\033[0m"
echo -e "\033[36m"SETUP.SH END"\033[0m"
echo -e "\033[32m"=========================================================================="\033[0m"

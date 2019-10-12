export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config:$HOME/.kube/d2-minikube-config

source /home/abby/.oh-my-zsh/custom/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT

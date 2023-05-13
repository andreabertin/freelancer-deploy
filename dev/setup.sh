# This script setups whole environment on k8s cluster

# Add Repositories
helm repo add grafana https://grafana.github.io/helm-charts
helm repo add loki https://grafana.github.io/loki/charts
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Create APP namespace
kubectl create namespace freelancer

# Add Grafana
#echo 'Add Grafana'
#helm upgrade --install grafana --namespace=freelancer grafana/grafana
#kubectl get secret --namespace freelancer grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

# Add Loki
echo 'Add LOKI'
#helm upgrade --install promtail --namespace=freelancer grafana/promtail
helm upgrade --install loki --namespace=freelancer grafana/loki-stack
#Verify the application is working by running these commands:
#* kubectl --namespace freelancer port-forward daemonset/promtail 3101
#* curl http://127.0.0.1:3101/metrics


# Add Prometheus
echo 'Add Prometheus'
helm upgrade --install prometheus --namespace=freelancer prometheus-community/prometheus

# Expose Services externally
echo 'Expose Services externally'
#kubectl expose service grafana --type=LoadBalancer --target-port=3000 --port=8100 --name=grafana-np --namespace=freelancer
kubectl expose service prometheus-server --type=LoadBalancer --target-port=9090 --port=8200 --name=prometheus-np --namespace=freelancer
kubectl apply -k . --namespace=freelancer

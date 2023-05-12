# Keycloak

## Export realm

./kc.sh export --file freelancer_it --realm freelancer_it

## Location

/opt/keycloak/bin

# K8S

## Enter into POD

kubectl exec --stdin --tty keycloak-5bc5c7fbf-bmkqt -n freelancer -- /bin/bash

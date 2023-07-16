#

## Ejecutar en local (Minikube)

```
kubectl apply -f k8s/
```

### Comprobaciones

comprobar por el pod
```
k port-forward pods/dpl-alzatest-fron-xxxxxxxxxxx-xxxxx 8000:80
```

Comprobar por el servicio
```
k port-forward services/svc-alzatest-front 8000:80
```

Ahora podemos abrir el navedor y utilizar la aplicación en `localhost:8000`.

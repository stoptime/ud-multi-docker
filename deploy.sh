docker build -t stoptime/multi-client:latest -t stoptime/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t stoptime/multi-server:latest -t stoptime/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t stoptime/multi-worker:latest -t stoptime/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push stoptime/multi-client:lastest
docker push stoptime/multi-server:lastest
docker push stoptime/multi-worker:lastest
docker push stoptime/multi-client:$SHA
docker push stoptime/multi-server:$SHA
docker push stoptime/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=stoptime/multi-server:$SHA
kubectl set image deployments/client-deployment client=stoptime/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=stoptime/multi-worker:$SHA
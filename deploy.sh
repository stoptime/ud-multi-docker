docker build -t stoptime9/multi-client:latest -t stoptime9/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t stoptime9/multi-server:latest -t stoptime9/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t stoptime9/multi-worker:latest -t stoptime9/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push stoptime9/multi-client:lastest
docker push stoptime9/multi-server:lastest
docker push stoptime9/multi-worker:lastest
docker push stoptime9/multi-client:$SHA
docker push stoptime9/multi-server:$SHA
docker push stoptime9/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=stoptime9/multi-server:$SHA
kubectl set image deployments/client-deployment client=stoptime9/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=stoptime9/multi-worker:$SHA
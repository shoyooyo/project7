docker build -t shoyooyo/project7client:latest -f ./client/Dockerfile ./client
docker build -t shoyooyo/project7client:$SHA -f ./client/Dockerfile ./client
docker build -t shoyooyo/project7server:latest -f ./server/Dockerfile ./server
docker build -t shoyooyo/project7server:$SHA -f ./server/Dockerfile ./server
docker build -t shoyooyo/project7worker:latest -f ./worker/Dockerfile ./worker
docker build -t shoyooyo/project7worker:$SHA -f ./worker/Dockerfile ./worker

docker push shoyooyo/project7client:latest 
docker push shoyooyo/project7server:latest 
docker push shoyooyo/project7worker:latest 

docker push shoyooyo/project7client:$SHA
docker push shoyooyo/project7server:$SHA
docker push shoyooyo/project7worker:$SHA

kubectl apply -f kube8s/
kubectl set image deployments/server-deployment server=shoyooyo/project7server:$SHA
kubectl set image deployments/client-deployment client=shoyooyo/project7client:$SHA
kubectl set image deployments/worker-deployment worker=shoyooyo/project7worker:$SHA
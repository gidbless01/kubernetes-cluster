set -e

NAME="kubernetes-demo-api"
USERNAME="paulina291"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker image..."
docker build -t $IMAGE .

echo "Pushing Docker image..."
docker push $IMAGE

echo "Deploying to Kubernetes mainifest..."
kubectl apply -f deployment.yaml
kubectl apply -f server.yaml

echo "Getting pods..."
kubectl get pods

echo "Getting services..."
kubectl get services

echo "Fetching the main service"
kubectl get services $NAME-service
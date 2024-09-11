set -u # or set -o nounset
set -x # Enable debugging

# Check that variables are set
: "$CONTAINER_REGISTRY"
: "$VERSION"
: "$REGISTRY_UN"
: "$REGISTRY_PW"

# Debug output to ensure variables are correctly passed
echo "CONTAINER_REGISTRY: $CONTAINER_REGISTRY"
echo "VERSION: $VERSION"
echo "REGISTRY_UN: $REGISTRY_UN"
# Do not echo password for security reasons

# Docker login
echo $REGISTRY_PW | docker login $CONTAINER_REGISTRY --username $REGISTRY_UN --password-stdin || exit 1

# Push the Docker image
docker push $CONTAINER_REGISTRY/video-streaming:$VERSION || exit 1

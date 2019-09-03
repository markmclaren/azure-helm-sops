# azure-helm-sops
Docker image containing Azure, Helm and Sops

https://hub.docker.com/r/markmclaren/azure-helm-sops

The Docker image originates from a private BitBucket repository, I wanted an image with Azure CLI, Helm, Helm Secrets and SOPS installed to use inside a Bitbucket Pipeline.

I have since stopped using a Bitbucket Pipeline and decided to use Jenkins instead.

I don't install kubectl because I use "az aks install-cli" and "az aks get-credentials".

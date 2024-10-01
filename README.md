# azure-dokku-deployment

> This repo demonstrates how to deploy a dockerized full stack application to Azure Cloud with [DokKu](https://dokku.com/docs/deployment/application-deployment/).

## Getting started

### Prerequisites
- [Azure account](https://azure.microsoft.com/en-us/free/)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Docker](https://docs.docker.com/get-docker/)

### Local deployment

1. Clone the repo
   ```sh
   git clone https://github.com/atrakic/azure-dokku-deployment.git
   ```

2. Create a infrastructure on Azure Cloud
   ```make infra ```

3. Deploy the app to Dokku
   ```make ```

4. Open the app in your browser


### GitHub Actions deployment

1. Fork this repo
2. Create a new secret in your forked repo with the name `SSH_PRIVATE_KEY` and add the value of your private SSH key. This key will be used to authenticate with the Dokku server.
3. Push a change to your forked repo to trigger the GitHub Actions workflow

## License Information

This project is licensed under the MIT License. View the [LICENSE](LICENSE) file for more details.

# Doing a manual deployment or update.

This guide outlines the steps for deploying/updating a project deployment.

## Step 1: Map your docker registry's FQDN

By going into /etc/hosts add the following line:

```shell
10.6.6.63 tcmtlgit01.testcells.local
```

## Step 2: Add GitLab's certificate

## Step 3: Copy the project's deploy branch

This branch contains a generic .env file, a docker-compose.deploy.ymk and an nginx default.conf.
With those files we have enough to deploy the entire project.

```shell
git clone --branch deploy <remote-repo-url>
```

## Step 4: Make sure you're logged into the Docker registry

Before you can get your project's images, you need to log in to your Docker registry. Use the docker login command with your registry's URL. You can find this URL inside your GitLab project's Docker registry section.

```shell
docker login registry_url:5050
```

## Step 5: Modify the docker-compose file to pull your project's images along with the needed BaseImages

Essentially you want to pull all built images for your project and the needed images.

In this case we may also update an image on this deployment by modifying the tag to be pulled inside of the docker-compose.

## Step 6: Modify the .env file as you need

You may modify everything based on your needs. DB credentials, image registry URLs 

Essentially you want to pull all built images for your project and the needed images.

In this case we may also update an image on this deployment by modifying the tag to be pulled inside of the docker-compose.

## Step 6: Start the deployment process.

Assuming you have stopped the other running containers, if any were running, and are now ready to make the update:

```shell
docker compose -f docker-compose.deploy.yml up
```



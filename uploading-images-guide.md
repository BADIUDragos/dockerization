# Pushing a New Image to BaseImages or Other Project

This guide outlines the steps for pushing a new Docker image to a project like BaseImages or any other project you're working on. Whether you've built an image yourself or pulled one from Docker Hub, follow these steps to push it to your project's Docker registry.

## Step 1: Map your docker registry's FQDN

By going into /etc/hosts add the following line:

```shell
10.6.6.63 tcmtlgit01.testcells.local
```

## Step 2: List Your Docker Images

First, ensure you have the Docker image you intend to push. List all available Docker images on your system:

```shell
docker images
```

## Step 3: Log in to the Docker Registry

Before you can push an image, you need to log in to your Docker registry. Use the docker login command with your registry's URL. You can find this URL inside your GitLab project's Docker registry section.

```shell
docker login registry_url:5050
```

## Step 4: Step 3: Tag Your Docker Image

Tagging your Docker image correctly is crucial. The general format for a Docker image in the registry is:

```shell
gitlab_url:5050/user_who_created_the_project/project_name/image:tag
```

Use the docker tag command to tag your local image for the registry:

```shell
docker tag local_image_name:local_tag gitlab_url:5050/user_who_created_the_project/project_name/registry_image_name:registry_tag
```

This step allows you to rename the image (and tag) for the registry, different from your local name/tag if desired. For example, an image backend-something:1.2.3 can be tagged as gitlab_url:5050/user_who_created_the_project/project_name/backend:2.2.2.

## Step 5: Verify the New Tag

After tagging, verify that the image is correctly tagged and ready for push:

```shell
docker images
```

## Step 6: Push the Image to the Registry

Finally, push your tagged image to the Docker registry with the docker push command:

```shell
docker push gitlab_url:5050/user_who_created_the_project/project_name/registry_image_name:registry_tag
```
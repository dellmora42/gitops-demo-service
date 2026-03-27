# Gitops Demo Service Project

## Overview

A service used to help learn the gitops and observability process.  Contains a small python fastapi service as well as the ci-cd pipeline for building/tagging and pushing docker images to the repo. Pipeline also handles updating the config repo to reflect what tags to use for the respective deployments (staging/production).

This is based off the demo presented on pluralsight at [Microservices: DevOps from CI/CD to Monitoring](https://app.pluralsight.com/ilx/video-courses/microservices-devops-ci-cd-monitoring/course-overview). The code and tutorial does not properly cover adapting CI/CD and the provided code does not do what the video states it does. I am adapting it here for changes to reflect my preferred tools.

## Links

- Github service repo [gitops-demo-service](https://github.com/dellmora42/gitops-demo-service)
- Github config repo [gitops-demo-config](https://github.com/dellmora42/gitops-demo-config)
- Docker Repo [gitops-demo-service images](https://hub.docker.com/repository/docker/dellmora42/gitops-demo-service/general)

## Local Service Build

- `pip install build`
- `pip install .`
- `hello-cli`

## Local Test

- `pip install build`
- `pip install .`
- `pytest`

## CI/CD Setup and Notes

Configure secrets for actions on this github repo:

- DOCKER_TOKEN (personal access token for the docker repo)
- DOCKER_USERNAME (docker username)
- K8S_GITHUB_PAT (personal access token for the config repo)

### Pushing Branch Results

- Pushing the develop branch results in creating an image tagged develop and the config files updated with that image.
- Completeing a merge request to main or directly pushing to main results in tagging an image as latest. This also updates the config file for production with that image tag.
- Creating and pushing a new tag to github results in building and tagging an image with the version as well as updating the production config files.

When pushing a new tag be aware that it will build off the current HEAD of the branch you push from. Even if on a develop or other branch it will use that HEAD but the production config will be updated to use that version. Recomended to only push a tag from the most up to date main branch.

TODO: change pipelines so tag alays uses main branch

# Notes


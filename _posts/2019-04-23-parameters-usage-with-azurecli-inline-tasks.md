---
title: Pass arguments to Azure CLI tasks with Ubuntu hosted agent
date: 2019-04-23 15:00:00 +0000
tags: azure-cli azure bash scripting
published: true
---

Lately I've been professionally dedicated to a lot of DevOps related tasks, including setting up some Azure DevOps pipelines for Continuous Integration and Deployment of a customer's solution. In this specific case it was required to use Ubuntu hosted agents to run the release pipeline tasks. While setting those up I came across some issues while trying to pass some pipeline variables to an Azure CLI task.

Having issues when passing pipeline variables to Azure CLI tasks is something many users already come across with and there are [issues opened in the past](https://github.com/Microsoft/azure-pipelines-tasks/issues/9416) on the Azure Pipeline Tasks GitHub repository.

After some research and giving some thought on all possible solutions I've decided to use a key/value pair syntax when passing the arguments so I could parse those arguments by key during the script execution and make it as readable as possible. I'm really not a fan of the using the index of the arguments, specially when you have to deal with many.

The final inline script I've developed looks something like the following:

<script src="https://gist.github.com/nuno-barreiro/fba576a30844c5ebb6d815511d8466a2.js"></script>

Now it's just a matter of passing the needed arguments the right way. Supposing we want to deploy to a storage account 'testcontaineraccount' and to the $web container used when deploying static websites, we could pass the following arguments to this script:

```
ACCOUNT_NAME=testcontaineraccount CONTAINER_SOURCE=$web
```

The pipeline task configuration screen will then look something like the below figure.

![Azure CLI task screenshot](/assets/images/posts/azure_cli_arguments_linux.png){:class="mx-auto d-block"}

Hope this helped. See you on the next post.
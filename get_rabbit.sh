    #!/bin/sh

    ## If sudo is not available on the system,
    ## uncomment the line below to install it
    # apt-get install -y sudo

    sudo apt-get update -y

    ## Install prerequisites
    sudo apt-get install curl gnupg -y

    ## Install RabbitMQ signing key
    curl -fsSL https://github.com/rabbitmq/signing-keys/releases/download/2.0/rabbitmq-release-signing-key.asc | sudo apt-key add -

    ## Install apt HTTPS transport
    sudo apt-get install apt-transport-https

    ## Add Bintray repositories that provision latest RabbitMQ and Erlang 21.x releases
    sudo tee /etc/apt/sources.list.d/bintray.rabbitmq.list <<EOF
    ## Installs the latest Erlang 21.x release.
    ## Change component to "erlang" to install the latest version (22.x or later).
    ## "bionic" as distribution name should work for any later Ubuntu or Debian release.
    ## See the release to distribution mapping table in RabbitMQ doc guides to learn more.

    deb https://dl.bintray.com/rabbitmq-erlang/debian bionic erlang-21.x
    deb https://dl.bintray.com/rabbitmq/debian bionic main
    EOF

    ## Update package indices
    sudo apt-get update -y

    ## Install rabbitmq-server and its dependencies
    sudo apt-get install rabbitmq-server -y --fix-missing
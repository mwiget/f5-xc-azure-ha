FROM gitpod/workspace-base

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - \
      && sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
      && sudo apt-get update && sudo apt-get install -y -q terraform inetutils-ping tmux \
      && wget --quiet -O terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.37.1/terragrunt_linux_amd64 \
      && chmod +x terragrunt \
      && sudo mv terragrunt /usr/local/bin/ \
      && curl -sLO "https://vesio.azureedge.net/releases/vesctl/$(curl -s https://downloads.volterra.io/releases/vesctl/latest.txt)/vesctl.linux-amd64.gz" \
      && gzip -d  vesctl.linux-amd64.gz \
      && chmod +x vesctl.linux-amd64 \
      && sudo mv  vesctl.linux-amd64 /usr/local/bin/vesctl \
      && curl -sLO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
      && chmod +x kubectl \
      && sudo mv kubectl /usr/local/bin/ \
      && curl -L https://github.com/derailed/k9s/releases/download/v0.25.8/k9s_Linux_x86_64.tar.gz | sudo tar -C /usr/local/bin -xvz k9s \
      && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
      && unzip awscliv2.zip \
      && sudo ./aws/install \
      && rm -rf aws awscliv2.zip

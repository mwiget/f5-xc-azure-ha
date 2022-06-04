terraform {
    extra_arguments "volterra" {
        commands = ["apply","plan","destroy"]
        arguments = []
    }
}

inputs = {
    projectPrefix          = "mwha"
    namespace              = "mwha"
    volterraTenant         = "playground"
    volterraCloudCredAzure = "sun-az-creds"

    azureRegion1           = "westus2"
    azureRegion2           = "uksouth"
    azureRegion2_ar        = false

    # ssh key value
    ssh_public_key       = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDr1zH+NmWzf/+qtCTqC/+QAHoWIoq3k3YjH/IsjYdHXZ0mQonsMlrL+owArvLtvi3gXxqPGlO/aWt53v8KAY+RV7IOSbqfFY56k0GTmvPJisSsBkAedruu05hqlFMS/2mkNFL/BsWNzL617LtuFQpN6ud57QSrQruQQtIKTuWUe+XjqkSNiAkvD4zc4tip9ovULhC9QY/IVmhguVDJ0FuQWCDd4l7IM+KjlTXGplN5Y9bIVuU+nnSHnUEkRFxuGX1pvOHB1L31INlD9CVJHDA6bBJyIQgv0WcqoA2/3/8eRqN/pXOe+clglJGRT6bb/+5Sfy6JZoA0OlsyW66VfGR3 mwiget@xeon"
}

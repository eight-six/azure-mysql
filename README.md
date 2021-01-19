# azure-mysql

## Prerequisites

- [PowerShell 7](https://github.com/PowerShell/PowerShell/releases) (tested with v7.1.0)
- [PowerShell Az module](https://docs.microsoft.com/en-us/powershell/azure/new-azureps-module-az?view=azps-5.3.0) - (tested with v.4.2.0)

## Getting Started

- Clone or download this repo.
- Navigate to the folder containing the local version of this repo in PowerShell
- Create target resource group using Azure Portal, Az PowerShell or Azure CLI.
- Update parameter file as required Default provided in `parameters` file - see [Parameters](#Parameters) section for details.
- Run the interactive deployment script: (this will securely prompt for administrator password)

```Powershell
$ .\deploy\interactive.ps1 -ResourceGroupName 'test-mysql-resource-group'

Enter admin password: **********

DeploymentName          : template
ResourceGroupName       : test-client-mysql-resource-group
ProvisioningState       : Succeeded
Timestamp               : 19/01/2021 14:54:57
Mode                    : Incremental
TemplateLink            :
Parameters              :
                          Name                          Type                       Value
                          ============================  =========================  ==========
                          administratorLogin            String                     gracehopper
                          administratorLoginPassword    SecureString
                          location                      String                     uksouth
                          serverName                    String                     test-server-name
                          skuCapacity                   Int                        2
                          skuFamily                     String                     Gen5
                          skuName                       String                     B_Gen5_2
                          skuSizeMB                     Int                        51200
                          skuTier                       String                     Basic
                          version                       String                     5.7
                          backupRetentionDays           Int                        7
                          geoRedundantBackup            String                     Disabled
                          previewFeature                String
                          tags                          Object                     {}
                          storageAutoGrow               String                     Enabled
                          infrastructureEncryption      String                     Disabled
                          firewallRules                 Array                      []
Outputs                 :
DeploymentDebugLogLevel :
```

## Parameters

Most of the parameters below match closely with their equivalents for the related resource templates in which they are used, all of which are documented on <https://docs.microsoft.com/en-us/azure/templates/>.

### administratorLogin

A non-null value must be provided - see [ServerPropertiesForDefaultCreate object](https://docs.microsoft.com/en-us/azure/templates/Microsoft.DBforMySQL/2017-12-01/servers#microsoftdbformysqlservers-object) for usage. For automated deployments this value is best set from a value stored in an existing Key Vault.

```json
  "parameters": {
       ...
        "administratorLogin": {
            "value": null
        },
        ...
  }
```

### administratorLoginPassword

You can supply non-null value here, but it is *strongly* recommended that you do not.  For interactive deployments it is preferable to use the ability of the [New-AzResourceGroupDeployment](https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azresourcegroupdeployment?view=azps-5.3.0) cmdlet to provide values for template parameters - see provided [deployment script](./deploy/interactive) for an example of this. For automated deployments this value is best set from a value stored in an existing Key Vault.

```json
  "parameters": {
       ...
        "administratorLoginPassword": {
            "value": null
        },
      ...
  }
```

### serverName

A non-null value must be provided  - see [Microsoft.DBforMySQL/servers object](https://docs.microsoft.com/en-us/azure/templates/Microsoft.DBforMySQL/2017-12-01/servers#microsoftdbformysqlservers-object) for usage.

```json
  "parameters": {
        ...
        "serverName": {
            "value": "my-mysql-server"
        },
        ...
  }
```

### location

Default provided in `parameters` file - see [Microsoft.DBforMySQL/servers object](https://docs.microsoft.com/en-us/azure/templates/Microsoft.DBforMySQL/2017-12-01/servers#microsoftdbformysqlservers-object) for usage.

```json
  "parameters": {
       ...
        "location": {
            "value": "uksouth"
        },
        ...
  }
```

### skuName

Default provided in `parameters` file - see [SKU object](https://docs.microsoft.com/en-us/azure/templates/Microsoft.DBforMySQL/2017-12-01/servers#Sku) for usage.

```json
  "parameters": {
       ...
        "skuName": {
            "value": "B_Gen5_2"
        },
        ...
  }
```

### skuTier

Default provided in `parameters` file - see [SKU object](https://docs.microsoft.com/en-us/azure/templates/Microsoft.DBforMySQL/2017-12-01/servers#Sku) for usage.

```json
  "parameters": {
       ...
        "skuTier": {
            "value": "Basic"
        },
        ...
  }
```

### skuCapacity

Default provided in `parameters` file - see [SKU object](https://docs.microsoft.com/en-us/azure/templates/Microsoft.DBforMySQL/2017-12-01/servers#Sku) for usage.

```json
  "parameters": {
       ...
        "skuCapacity": {
            "value": 2
                },
        ...
  }
```

### skuFamily

Default provided in `parameters` file - see [SKU object](https://docs.microsoft.com/en-us/azure/templates/Microsoft.DBforMySQL/2017-12-01/servers#Sku) for usage.

```json
  "parameters": {
       ...
        "skuFamily": {
            "value": "Gen5"
                },
        ...
  }
```

### skuSizeMB

Default provided in `parameters` file - see [SKU object](https://docs.microsoft.com/en-us/azure/templates/Microsoft.DBforMySQL/2017-12-01/servers#Sku) for usage.

```json
  "parameters": {
       ...
        "skuSizeMB": {
            "value": 51200
                },
        ...
  }
```

### backupRetentionDays

Default provided in `parameters` file - see [StorageProfile object](https://docs.microsoft.com/en-us/azure/templates/Microsoft.DBforMySQL/2017-12-01/servers#storageprofile-object) for usage.

```json
  "parameters": {
       ...
        "backupRetentionDays": {
            "value": 7
                },
        ...
  }
```

### geoRedundantBackup

Default provided in `parameters` file - see [StorageProfile object](https://docs.microsoft.com/en-us/azure/templates/Microsoft.DBforMySQL/2017-12-01/servers#storageprofile-object) for usage.

```json
  "parameters": {
       ...
        "geoRedundantBackup": {
            "value": "Disabled"
                },
        ...
  }
```

### storageAutoGrow

Default provided in `parameters` file - see [StorageProfile object](https://docs.microsoft.com/en-us/azure/templates/Microsoft.DBforMySQL/2017-12-01/servers#storageprofile-object) for usage.

```json
  "parameters": {
       ...
        "storageAutoGrow": {
            "value": "Enabled"
        },
        ...
  }
```

### tags

Default provided in `parameters` file - see [Microsoft.DBforMySQL/servers object](https://docs.microsoft.com/en-us/azure/templates/Microsoft.DBforMySQL/2017-12-01/servers) for usage.

```json
  "parameters": {
       ...
        "tags": {
            "value": {}
        },
        ...
  }
```

### infrastructureEncryption

Default provided in `parameters` file - see [ServerPropertiesForCreate object](https://docs.microsoft.com/en-us/azure/templates/Microsoft.DBforMySQL/2017-12-01/servers#serverpropertiesforcreate-object) for usage.

```json
  "parameters": {
       ...
        "infrastructureEncryption": {
            "value": "Disabled"
                },
        ...
  }
```

### version

Default provided in `parameters` file - see [ServerPropertiesForCreate object](https://docs.microsoft.com/en-us/azure/templates/Microsoft.DBforMySQL/2017-12-01/servers) for usage.

```json
  "parameters": {
        ...
        "version": {
            "value": "5.7"
                },
        ...
  }
```

### firewallRules

For each firewall rule add an object with these properties to the `value` array
 of this parameter.

```json
{
    "name": "<fw-rule-name>",
    "startIpAddress": "<valid-ipv4-address>",
    "endIpAddress": "<valid-ipv4-address>"
}
```

See [Microsoft.DBforMySQL servers/firewallRules](
https://docs.microsoft.com/en-us/azure/templates/microsoft.dbformysql/2017-12-01/servers/firewallrules) for details of these properties.

**Example:**

```json
  "parameters": {
       ...
        "firewallRules": {
            "value": [               
                {
                    "name": "Office",
                    "startIpAddress": "127.0.0.1",
                    "endIpAddress": "127.0.0.1"
                }
            ]
        }
    }

```

Note:  the invalid value `127.0.0.1` (for a public IP address)is used above deliberately in order to prevent accidentally opening a hole in the firewall from copy & pasting this example.

#### Allow all Azure IPs

To allow access from any Azure IP you can set both `startIpAddress` and `endIpAddress` to `"0.0.0.0"` as shown below.

Note: this is *not* recommended for most scenarios and should only be used where no other option exists and you fully appreciate the security impact of this decision.

```json
  "parameters": {
       ...
        "firewallRules": {
            "value": [               
                {
                    "name": "AllowAllAzureIPs",
                    "startIpAddress": "0.0.0.0",
                    "endIpAddress": "0.0.0.0"
                }
            ]
        }
    }
```

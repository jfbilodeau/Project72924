param location string = resourceGroup().location
param appServicePlanName string
param webAppName string
param skuName string = 'P1V2'
param skuTier string = 'PremiumV2'

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: skuName
    tier: skuTier
  }
  properties: {
    reserved: true
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        }
      ]
      linuxFxVersion: 'DOTNET|8.0' // Specify .NET 8.0 runtime stack
    }
  }
}

output appServicePlanId string = appServicePlan.id
output webAppUrl string = webApp.properties.defaultHostName

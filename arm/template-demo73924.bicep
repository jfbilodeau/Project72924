param location string = resourceGroup().location
param appServicePlanName string
param webAppName string
param skuName string = 'P0V1'
param skuTier string = 'PremiumV3'

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: skuName
    tier: skuTier
  }
  properties: {
    reserved: false
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      netFrameworkVersion: 'v8.0'
    }
  }
}

output appServicePlanId string = appServicePlan.id
output webAppUrl string = webApp.properties.defaultHostName

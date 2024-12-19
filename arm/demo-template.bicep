param sites_demo72924_name string = 'demo72924'
param serverfarms_demo72924_asp_name string = 'demo72924-asp'

resource serverfarms_demo72924_asp_name_resource 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: serverfarms_demo72924_asp_name
  location: 'Canada Central'
  sku: {
    name: 'P0v3'
    tier: 'Premium0V3'
    size: 'P0v3'
    family: 'Pv3'
    capacity: 1
  }
  kind: 'linux'
  properties: {
    perSiteScaling: false
    elasticScaleEnabled: false
    maximumElasticWorkerCount: 1
    isSpot: false
    reserved: true
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
    zoneRedundant: false
  }
}

resource sites_demo72924_name_resource 'Microsoft.Web/sites@2023-12-01' = {
  name: sites_demo72924_name
  location: 'Canada Central'
  kind: 'app,linux'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_demo72924_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_demo72924_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_demo72924_asp_name_resource.id
    reserved: true
    isXenon: false
    hyperV: false
    dnsConfiguration: {}
    vnetRouteAllEnabled: false
    vnetImagePullEnabled: false
    vnetContentShareEnabled: false
    siteConfig: {
      numberOfWorkers: 1
      linuxFxVersion: 'DOTNETCORE|8.0'
      acrUseManagedIdentityCreds: false
      alwaysOn: true
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 0
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    vnetBackupRestoreEnabled: false
    customDomainVerificationId: '8C28EE57703A4FE63D5969BAFE5F0EBEA0BA19E76422D978981B6BA1E5EDC60E'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    redundancyMode: 'None'
    publicNetworkAccess: 'Enabled'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_demo72924_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2023-12-01' = {
  parent: sites_demo72924_name_resource
  name: 'ftp'
  location: 'Canada Central'
  properties: {
    allow: false
  }
}

resource sites_demo72924_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2023-12-01' = {
  parent: sites_demo72924_name_resource
  name: 'scm'
  location: 'Canada Central'
  properties: {
    allow: false
  }
}

resource sites_demo72924_name_web 'Microsoft.Web/sites/config@2023-12-01' = {
  parent: sites_demo72924_name_resource
  name: 'web'
  location: 'Canada Central'
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v4.0'
    linuxFxVersion: 'DOTNETCORE|8.0'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: 'REDACTED'
    scmType: 'None'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: true
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: true
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    publicNetworkAccess: 'Enabled'
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 0
    elasticWebAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 0
    azureStorageAccounts: {}
  }
}

resource sites_demo72924_name_44c8f0a6_871d_47a1_8da4_b2a907e08c29 'Microsoft.Web/sites/deployments@2023-12-01' = {
  parent: sites_demo72924_name_resource
  name: '44c8f0a6-871d-47a1-8da4-b2a907e08c29'
  location: 'Canada Central'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY'
    message: '{"type":"deployment","sha":"9036c173e2c7462682667a305f3c9190e3cd1b18","repoName":"jfbilodeau/Project72924","actor":"jfbilodeau","slotName":"production","commitMessage":"Fixed my boo boo"}'
    start_time: '2024-12-18T21:54:22.4642149Z'
    end_time: '2024-12-18T21:54:24.4339273Z'
    active: false
  }
}

resource sites_demo72924_name_8d8d1766_1086_43b0_95df_25e4b4272581 'Microsoft.Web/sites/deployments@2023-12-01' = {
  parent: sites_demo72924_name_resource
  name: '8d8d1766-1086-43b0-95df-25e4b4272581'
  location: 'Canada Central'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY'
    message: '{"type":"deployment","sha":"d649926354051f310149310bcfab9c3c3f24d8e7","repoName":"jfbilodeau/Project72924","actor":"jfbilodeau","slotName":"production","commitMessage":"Update BoringApp.yaml"}'
    start_time: '2024-12-18T22:23:17.8011309Z'
    end_time: '2024-12-18T22:23:19.5857271Z'
    active: false
  }
}

resource sites_demo72924_name_9bc34834_8b2e_4299_927c_365c766985f5 'Microsoft.Web/sites/deployments@2023-12-01' = {
  parent: sites_demo72924_name_resource
  name: '9bc34834-8b2e-4299-927c-365c766985f5'
  location: 'Canada Central'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY'
    message: '{"type":"deployment","sha":"a6d1986933295412b29aa0a9811a70bdffbaaa23","repoName":"jfbilodeau/Project72924","actor":"jfbilodeau","slotName":"production","commitMessage":"Update BoringApp.yaml"}'
    start_time: '2024-12-18T22:25:57.2564728Z'
    end_time: '2024-12-18T22:25:59.349125Z'
    active: false
  }
}

resource sites_demo72924_name_b3455a01_aaa7_41a9_bfe0_959220c3568f 'Microsoft.Web/sites/deployments@2023-12-01' = {
  parent: sites_demo72924_name_resource
  name: 'b3455a01-aaa7-41a9-bfe0-959220c3568f'
  location: 'Canada Central'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY'
    message: '{"type":"deployment","sha":"9c2716957d30d5fbc8d32319413d5a49ad44d95e","repoName":"jfbilodeau/Project72924","actor":"jfbilodeau","slotName":"production","commitMessage":"Update BoringApp.yaml"}'
    start_time: '2024-12-18T22:29:13.6122383Z'
    end_time: '2024-12-18T22:29:17.1353091Z'
    active: true
  }
}

resource sites_demo72924_name_b7835bd3_d4a9_4845_b801_7ad16662c5fb 'Microsoft.Web/sites/deployments@2023-12-01' = {
  parent: sites_demo72924_name_resource
  name: 'b7835bd3-d4a9-4845-b801-7ad16662c5fb'
  location: 'Canada Central'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY'
    message: '{"type":"deployment","sha":"2fd30e4def3495402e76da335b65bd1546a21ad2","repoName":"jfbilodeau/Project72924","actor":"jfbilodeau","slotName":"production","commitMessage":"Update BoringApp.yaml"}'
    start_time: '2024-12-18T22:19:25.9239266Z'
    end_time: '2024-12-18T22:19:27.7146073Z'
    active: false
  }
}

resource sites_demo72924_name_sites_demo72924_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2023-12-01' = {
  parent: sites_demo72924_name_resource
  name: '${sites_demo72924_name}.azurewebsites.net'
  location: 'Canada Central'
  properties: {
    siteName: 'demo72924'
    hostNameType: 'Verified'
  }
}

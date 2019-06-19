pipeline {
  agent any
  stages {
    stage('Netsparker Scan') {
      steps {
        echo 'Netsparker Security Scan'
        NCScanBuilder(ncScanType: 'FullWithPrimaryProfile', ncWebsiteId: '5f22dc0a02ce4aa6a696aa6f0461d443', ncApiToken: 'h9fUZzvgNjOUveD6YWsgkfcelUN0LfA7QoYki0IWN3I=', ncServerURL: 'https://www.netsparkercloud.com')
      }
    }
  }
}
pipeline {
    environment {
        //AWS_ACCESS_KEY_ID = credentials("prod-s3-aws-access-key-id")
        AWS_ACCESS_KEY_ID = credentials("AWS_ACCESS_KEY_ID")
        //AWS_SECRET_ACCESS_KEY = credentials("prod-s3-aws-secret-access-key")
        AWS_SECRET_ACCESS_KEY = credentials("AWS_SECRET_ACCESS_KEY")
    }

    agent {
        dockerfile {
            filename 'Dockerfile'
            args '-u root'
        }
    }

    stages {
        stage("generate releases page") {
            steps {
                sh script: "./generate_releases_page.py > /tmp/index.html"
            }
        }

        stage("deploy to staging") {
            steps {
                sh script: "aws s3 cp /tmp/index.html s3://algorand-staging/releases-page/"
            }
        }
    }
}


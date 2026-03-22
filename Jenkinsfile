pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "sanketmahajan/full-stack-app"
        DOCKER_TAG = "latest"
        CONTAINER_NAME = "springboot-app"
    }

    tools {
        maven 'MAVEN'   // configure in Jenkins tools
    }

    stages {

       stage('Clone Code') {
    steps {
        git branch: 'main', url: 'https://github.com/sanketM1996/Full-Stack-MySql-Java.git'
    }
}

        stage('Build JAR') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

     stage('Build Docker Image') {
    steps {
        bat 'docker build -t %DOCKER_IMAGE%:%DOCKER_TAG% .'
    }
}

        
     stage('Login to Docker Hub') {
    steps {
        withCredentials([usernamePassword(
            credentialsId: 'docker',
            usernameVariable: 'DOCKER_USER',
            passwordVariable: 'DOCKER_PASS'
        )]) {
            bat '''
            echo Username: %DOCKER_USER%
            docker login -u %DOCKER_USER% -p %DOCKER_PASS%
            '''
        }
    }
}
      stage('Push Image') {
    steps {
        bat 'docker push %DOCKER_IMAGE%:%DOCKER_TAG%'
    }
}

        stage('Deploy Container') {
            steps {
                bat '''
                docker rm -f springboot-app || true
                docker run -d -p 8081:8080 \
                  --name springboot-app \
                  --network project \
                  -e SPRING_DATASOURCE_URL=jdbc:mysql://mysql-container:3306/devops_db \
                  -e SPRING_DATASOURCE_USERNAME=root \
                  -e SPRING_DATASOURCE_PASSWORD=root \
                  $DOCKER_IMAGE:$DOCKER_TAG
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Deployment Successful!'
        }
        failure {
            echo '❌ Pipeline Failed!'
        }
    }
}
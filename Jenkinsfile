node {
    stage('Preparation') {
        sh 'echo "Start at $(date "+%Y-%m-%d %H:%M:%S")"'
        sh 'pwd'
        git 'https://github.com/comoyi/hall.git'
    }
    stage('Build') {
        sh './gradlew build'
    }
    stage('Build docker image') {
        sh 'docker build -t comoyi/hall-eureka-server:0.0.1 hall-eureka-server'
        sh 'docker build -t comoyi/hall-admin:0.0.1 hall-admin'
    }
    stage('Test') {
        // TODO
    }
    stage('Deploy') {
        // sh 'kill $(ps -ef | grep hall-eureka-server | grep -v grep | awk \'{print $2}\') || true'
        // sh 'kill $(ps -ef | grep hall-admin | grep -v grep | awk \'{print $2}\') || true'
        // sh 'BUILD_ID=dontKillMe nohup java -jar hall-eureka-server/build/libs/hall-eureka-server-0.0.1-SNAPSHOT.jar > /var/log/hall-eureka-server.log 2>&1 &'
        // sh 'BUILD_ID=dontKillMe nohup java -jar hall-admin/build/libs/hall-admin-0.0.1-SNAPSHOT.jar > /var/log/hall-admin.log 2>&1 &'
        
        sh 'docker rm -f hall-eureka-server'
        sh 'docker rm -f hall-admin'
        sh 'docker run -i -t -d --name hall-eureka-server --net hall --hostname hall-eureka-server -p 8070:8070 comoyi/hall-eureka-server:0.0.1'
        sh 'docker run -i -t -d --name hall-admin --net hall --hostname hall-admin -p 8071:8071 comoyi/hall-admin:0.0.1'
    }
    stage('Results') {
        sh 'echo "Finished at $(date "+%Y-%m-%d %H:%M:%S")"'
    }
}

node {
   stage('Preparation') {
        sh 'echo "Start at $(date "+%Y-%m-%d %H:%M:%S")"'
        sh 'pwd'
        git 'https://github.com/comoyi/hall.git'
        sh 'kill $(ps -ef | grep hall-eureka-server | grep -v grep | awk \'{print $2}\')'
        sh 'kill $(ps -ef | grep hall-admin | grep -v grep | awk \'{print $2}\')'
   }
   stage('Build') {
        sh 'cd ./hall && ./gradlew build'
   }
   stage('Test') {
        // TODO
   }
   stage('Deploy') {
        sh 'BUILD_ID=dontKillMe nohup java -jar hall/hall-eureka-server/build/libs/hall-eureka-server-0.0.1-SNAPSHOT.jar > hall-eureka-server.log 2>&1 &'
        sh 'BUILD_ID=dontKillMe nohup java -jar hall/hall-admin/build/libs/hall-admin-0.0.1-SNAPSHOT.jar > hall-admin.log 2>&1 &'
   }
   stage('Results') {
        sh 'echo "Finished at $(date "+%Y-%m-%d %H:%M:%S")"'
   }
}

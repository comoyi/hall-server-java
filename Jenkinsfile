node {
   stage('Preparation') {
        echo "Preparation"
        sh 'echo "Start at $(date "+%Y-%m-%d %H:%M:%S")"'
        sh 'pwd'
        sh 'kill $(ps -ef | grep hall-eureka-server | grep -v grep | awk \'{print $2}\')'
        sh 'kill $(ps -ef | grep hall-admin | grep -v grep | awk \'{print $2}\')'
   }
   stage('Pull project code') {
        echo "Pull project code"
        // TODO
   }
   stage('Build') {
        echo "Build"
        sh 'cd ./hall && ./gradlew build'
   }
   stage('Test') {
        echo "Test"
   }
   stage('Deploy') {
        echo "Deploy"
        sh 'BUILD_ID=dontKillMe nohup java -jar hall/hall-eureka-server/build/libs/hall-eureka-server-0.0.1-SNAPSHOT.jar > hall-eureka-server.log 2>&1 &'
        sh 'BUILD_ID=dontKillMe nohup java -jar hall/hall-admin/build/libs/hall-admin-0.0.1-SNAPSHOT.jar > hall-admin.log 2>&1 &'
   }
   stage('Results') {
        echo "Result"
        sh 'echo "Finished at $(date "+%Y-%m-%d %H:%M:%S")"'
   }
}
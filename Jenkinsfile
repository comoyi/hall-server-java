node {
    stage('Preparation') {
        sh 'echo "Start at $(date "+%Y-%m-%d %H:%M:%S")"'
        sh 'pwd'
        def workspace = pwd()
        git 'https://github.com/comoyi/hall.git'
    }
    stage('Build') {
        sh './gradlew build'
    }
    stage('Build docker image') {
        sh 'docker build -t comoyi/hall-eureka-server:0.0.1 ./hall-eureka-server'
        sh 'docker build -t comoyi/hall-admin:0.0.1 ./hall-admin'
        sh 'docker build -t comoyi/hall-user:0.0.1 ./hall-user'
    }
    stage('Test') {
        // TODO
    }
    stage('Deploy') {
        sh """
            docker rm -f hall-eureka-server-1 || true
            docker rm -f hall-eureka-server-2 || true
            docker rm -f hall-eureka-server-3 || true
            docker rm -f hall-admin || true
            docker rm -f hall-user || true
        """

        sh """
            docker network create hall || true
        """

        sh """
            docker run -i -t -d \
                --name hall-eureka-server-1 \
                --net hall \
                --hostname hall-eureka-server-1 \
                -p 30101:30100 \
                -e APP_PROFILES=1 \
                -v ${workspace}/hall-eureka-server/build/libs:/data/app \
                comoyi/hall-eureka-server:0.0.1
        """

        sh """
            docker run -i -t -d \
                --name hall-eureka-server-2 \
                --net hall \
                --hostname hall-eureka-server-2 \
                -p 30102:30100 \
                -e APP_PROFILES=2 \
                -v ${workspace}/hall-eureka-server/build/libs:/data/app \
                comoyi/hall-eureka-server:0.0.1
        """

        sh """
            docker run -i -t -d \
                --name hall-eureka-server-3 \
                --net hall \
                --hostname hall-eureka-server-3 \
                -p 30103:30100 \
                -e APP_PROFILES=3 \
                -v ${workspace}/hall-eureka-server/build/libs:/data/app \
                comoyi/hall-eureka-server:0.0.1

        """

        sh """
            docker run -i -t -d \
                --name hall-admin \
                --net hall \
                --hostname hall-admin \
                -p 30201:30200 \
                -v ${workspace}/hall-admin/build/libs:/data/app \
                comoyi/hall-admin:0.0.1
        """

        sh """
            docker run -i -t -d \
                --name hall-user \
                --net hall \
                --hostname hall-user \
                -p 30301:30300 \
                -v ${workspace}/hall-user/build/libs:/data/app \
                comoyi/hall-user:0.0.1
        """
    }
    stage('Results') {
        sh 'echo "Finished at $(date "+%Y-%m-%d %H:%M:%S")"'
    }
}

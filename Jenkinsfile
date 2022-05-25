# 定义一个公共的方法
def deploy = {
    sh '''
        make env

        path=$(pwd)
        echo PROJECT_PATH="${path}" >> .env
        echo LOG_PATH="${HOME}" >> .env
        cat .env

        hostname -I
        inner_ip=$(hostname -I | awk '{print$1}')
        sudo bash ./jenkins.sh $inner_ip $DOCKER_TAG $BRANCH_ENV

        make "${SERVICES}-start"
        make clean-docker

    '''
}

pipeline {

  options { skipDefaultCheckout() }

  agent none

  parameters {
    string (name: 'HUB_DOMAIN', defaultValue: 'hub.docker.com', description: 'docker-hub仓库地址')
    string (name: 'PROJECT', defaultValue: 'my-project', description: '项目')
    string (name: 'DOCKER_TAG', defaultValue: 'latest', description: 'docker镜像tag，默认latest')
    string (name: 'PROJECT_PATH', defaultValue: '/home/ubuntu', description: '项目位置')
    string (name: 'LOG_PATH', defaultValue: '/home/ubuntu/logs', description: '日志落地位置')
    choice (
        name: 'BRANCH_ENV',
        choices: ['.dev', '.test', '.pre', '.pro'],
        description: '环境变量'
    )
    choice (
        name: 'SERVICES',
        choices: [
            'all', 'access-rpc', 'access-api',
            'users-rpc', 'users-api',
            'admin-api', 'server-api',
            'audit-api', 'task-api'
        ],
        description: '请选择需要发布的服务'
    )
  }

  stages {

    stage('Check on Controller') {
        agent { label 'HOST' }

        stages {
            stage('Cleaning workspace') {
                steps {
                    sh 'ls -l'
                    sh 'sudo rm -rf ./*'
                    }
            }

            stage('SCE Checkout') {
                steps {
                    checkout scm
                    }
            }

            stage('Stash artifacts') {
              steps {
                stash name: 'source', includes: '**', excludes: '**/.git,**/.git/**'

              }
            }
            stage('Build Image') {
              environment {
                HUB_DOMAIN = "${params.HUB_DOMAIN}"
                DOCKER_TAG = "${params.DOCKER_TAG}"
                PROJECT = "${params.PROJECT}"
                BRANCH_ENV = "${params.BRANCH_ENV}"
                SERVICES = "${params.SERVICES}"
                LOG_PATH = "${params.LOG_PATH}"
                PROJECT_PATH = "${params.PROJECT_PATH}"
              }
              steps {
                sh '''
                    make ${SERVICES}

                    make clean-docker

                    make env
                '''
              }
            }
        }

    }

    stage ('Deploy on Dev') {
      when { branch 'dev' }
      agent { label 'PROJECT-V2-TEST' }
      stages {
        stage('Cleaning workspace') {
            steps {
                sh 'ls -l'
                sh 'sudo rm -rf ./*'
            }
        }

        stage('Unstash artifacts') {
          steps {
            unstash 'source'

          }
        }

        stage('Starting containers') {
          steps {
            script {deploy ()}
          }
        }
      }
    }

    stage ('Deploy on TEST') {
      when { branch 'QA.TEST' }
      agent { label 'TEST-PROJECT-V2' }
      stages {
        stage('Cleaning workspace') {
            steps {
                sh 'ls -l'
                sh 'sudo rm -rf ./*'
            }
        }

        stage('Unstash artifacts') {
          steps {
            unstash 'source'

          }
        }

        stage('Starting containers') {
          steps {
            script {deploy ()}
          }
        }
      }
    }
    stage ('Deploy on RELEASE') {
      when { branch 'release' }
      agent { label 'PRE-RELEASE' }
      stages {
        stage('Cleaning workspace') {
            steps {
                sh 'ls -l'
                sh 'sudo rm -rf ./*'
            }
        }

        stage('Unstash artifacts') {
          steps {
            unstash 'source'

          }
        }

        stage('Starting containers') {
          steps {
            script {deploy ()}
          }
        }
      }
    }

  }
}

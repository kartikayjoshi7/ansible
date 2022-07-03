pipeline {
    agent { label 'WORKSTATION' }
    options {
            ansiColor('xterm')
        }

parameters {
    choice(name: 'ENV', choices: ['DEV', 'PROD'], description: 'Choose Env')
    string(name: 'COMPONENT', defaultValue: '', description: 'which app component')
}

    environment{
        SSH = credentials('CENTOS')
    }
    stages {
        stage('Create server') {
            steps {
                sh 'bash ec2-launch.sh ${COMPONENT} ${ENV}'
            }
        }
        stage('Ansible Playbook Run') {
            steps {
                script {
                 env.ANSIBLE_TAG=COMPONENT.toUpperCase()
                }
                sh 'ansible-playbook -i roboshop.inv roboshop.yml -e ENV=${ENV} -t ${ANSIBLE_TAG} -e ansible_password=${SSH_PSW} -u ${SSH_USR} '
            }
        }
    }
}
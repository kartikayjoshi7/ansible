pipeline {
    agent any


    stages {
        stage('Ansible Playbook Run') {
            steps {
                sh 'ansbile-playbook 08-parallel-plays.yml'
            }
        }
    }
}
def deploy_tomcat() {

    echo "deploying to tomcat server."
    sh '''
    cd ${WORKSPACE}/shellscripts
    sh ./deploy_java.sh
    '''
}
return this
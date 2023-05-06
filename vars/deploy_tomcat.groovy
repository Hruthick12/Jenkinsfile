def deploy_tomcat(String tag, String env) {

    echo "deploying to tomcat server."
    echo "env is ${env}"
    sh '''
       echo "WORKSPACE is ${WORKSPACE}"
       echo "environment is $env'"
       cd ${WORKSPACE}/shellscripts
       sh ./deploy_java.sh ${tag} ${env}
       '''
}
return this
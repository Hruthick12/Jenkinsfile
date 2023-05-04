def create_tag(String tag){

   sh """
   git log -1
   cd ${WORKSPACE}
   git tag -a ${tag} -m "this tag has been created from jenkinfile"
   git push origin ${tag}

       """


}
return this
def checkout_git(String repo, String branch){

    echo "this is for checking out git code."
     git credentialsId: 'github', url:"git@github.com:Hruthick12/${repo}.git",branch: "${branch}"

}
return this
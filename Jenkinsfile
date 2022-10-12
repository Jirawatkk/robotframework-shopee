pipeline {
   agent { label 'server03-tops' }
   stages {
      stage('Checkout Source Code') {
         steps {
            script {
               echo "param Test: "
               echo "param GIT_CREDENTIAL: ${params.GIT_CREDENTIAL}"
               echo 'Checking out code for gitlab'
            }
         }
      }
      stage('Run test'){
         steps{
            script{
               if (params.isRunEnable){
                  try{
                     echo "Run test is enabled"
                     sh "pabot --processes 2 -i ${params.INCLUDE_TAG} ./testcase/testcase.robot"
                  }
                  catch (err){
                     echo "Run fail"
                  }
               }
               if (params.isRerunEnable){
                  try{
                     echo "Run all include tag test case again"
                     sh "pabot --processes 2 ./testcase/testcase.robot"
                  }
                  catch (err) { 
                     echo "Run fail"
                  }
               }
            }
         }
      }
   }
   post {
      always {
         script{
         echo "Clean Workspace"
         cleanWs()
         }
      }
   }
} 




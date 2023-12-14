pipeline {
    agent any
    environment {
        GIT_CREDENTIALS_ID = 'd91e6530-10d7-4e0d-b2d1-91bddb382062'
    }
    tools {
        maven 'Maven'
   stage('Email Notification') {
        steps {
                script {
                    def mailRecipients = 'kumarmohit@bugraptors.com,sharmaharshit@seasiainfotec.com'
                    def jobName = currentBuild.fullDisplayName
                    def link = 'http://10.8.14.51:23868/job/seasia-connect-1/25/allure/' // Replace with the actual link to the report
                    def emailBody
                    if (currentBuild.currentResult == 'SUCCESS') {
                        emailBody = """
                            <html>
                            <body>
                                <p>Hello,</p>
                                <p>The pipeline build '${jobName}' has completed successfully.</p>
                                <p>You can view the report <a href="${link}">here</a>.</p>
                                <p>Thank you!</p>
                            </body>
                            </html>
                        """
                    } else {
                        emailBody = """
                            <html>
                            <body>
                                <p>Hello,</p>
                                <p>The pipeline build '${jobName}' has completed with errors.</p>
                                <p>You can view the report <a href="${link}">here</a>.</p>
                                <p>Thank you!</p>
                            </body>
                            </html>
                        """
                    }
                    emailext body: emailBody,
                        mimeType: 'text/html',
                        subject: "[Jenkins] Pipeline Build Complete: ${jobName}",
                        to: "${mailRecipients}",
                        replyTo: "",
                        recipientProviders: [[$class: 'CulpritsRecipientProvider']]
                }
            }
        }
    }
}
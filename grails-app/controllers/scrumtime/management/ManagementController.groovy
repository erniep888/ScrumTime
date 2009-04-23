package scrumtime.management

class ManagementController {

    def beforeInterceptor = {
        if (!session.authenticationToken) {
            redirect(controller: "userAuthentication", action: "index")
        }
    }

    def index = {
        redirect(controller:"product",action:"index")        
    }

}

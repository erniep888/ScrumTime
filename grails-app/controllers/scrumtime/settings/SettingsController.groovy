package scrumtime.settings

class SettingsController {

    def beforeInterceptor = {
        if (!session.userIdentity) {
            redirect(controller: "home", action: "index")
        }
    }

    def index = { }

    def requiresSettings = {
        render(view:'/settings/requiresSettings')
    }
}

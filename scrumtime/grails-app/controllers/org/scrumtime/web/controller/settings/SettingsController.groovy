package org.scrumtime.web.controller.settings

class SettingsController {

    def beforeInterceptor = {
        if (!session.userIdentity) {
            redirect(controller: "home", action: "index")
        }
    }

    def index = { }

    def requiresSettings = {
        render(view:'/org/scrumtime/web/views/settings/requiresSettings')
    }
}

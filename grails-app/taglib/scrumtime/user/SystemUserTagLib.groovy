package scrumtime.user

import javax.servlet.http.Cookie

class SystemUserTagLib {
    def localAuthenticationService

    static namespace = 'systemuser'

    def ifIsLoggedIn = {attrs, body ->
        if (session?.authenticationToken) {
            out << body()
        }
    }

    def ifNotLoggedIn = {attrs, body ->
        if (!session?.authenticationToken) {
            out << body()
        }
    }

    def useCookieLogin = {
        if (!session.userIdentity) {
            Cookie requestCookie = request.cookies.find { it.name == grailsApplication.config.grails.cookieName }
            if (requestCookie) {
                AuthenticationToken authenticationToken = localAuthenticationService.authenticateUser(requestCookie)
                if (authenticationToken && !authenticationToken.hasErrors) {
                    session.authenticationToken = authenticationToken
                }
            }
        }
    }
}
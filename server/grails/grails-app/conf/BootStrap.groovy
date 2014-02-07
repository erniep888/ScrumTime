import org.scrumtime.domain.user.Role
import org.scrumtime.domain.user.User
import org.scrumtime.domain.user.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

        def testUser = new User(username: 'erniep888', password: 'password1').save(flush: true)

        UserRole.create(testUser, adminRole, true)

        assert User.count() == 1
        assert Role.count() == 2
        assert UserRole.count() == 1

    }
    def destroy = {
    }
}

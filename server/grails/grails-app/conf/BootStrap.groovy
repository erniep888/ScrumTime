import scrumtime.Story
import scrumtime.user.Role
import scrumtime.user.User
import scrumtime.user.UserRole

class BootStrap {

    def init = { servletContext ->
//        Role adminRole, userRole;
//        User testUser;
//
//        User.executeUpdate("delete User u")
//        Role.executeUpdate("delete Role r")
//        UserRole.executeUpdate("delete UserRole ur")
//
//        if (Role.count() == 0){
//            adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
//            userRole = new Role(authority: 'ROLE_USER').save(flush: true)
//        }
//
//
//        if (User.count() == 0)
//            testUser = new User(username: 'erniep888', password: 'password1').save(flush: true)
//
//        if (UserRole.count() == 0)
//            UserRole.create(testUser, adminRole, true)

//        assert User.count() == 1
//        assert Role.count() == 2
//        assert UserRole.count() == 1

        def story = new Story(title: 'First story', narrative: 'As a user, I want to see stuff.')
        story.save();

    }
    def destroy = {
    }
}

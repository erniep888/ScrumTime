package commands

import org.springframework.web.multipart.MultipartFile
import grails.validation.Validateable

/**
 * Created with IntelliJ IDEA.
 * User: pascherk
 * Date: 4/19/12
 * Time: 1:03 PM
 * To change this template use File | Settings | File Templates.
 */
@Validateable
class ArtifactUploadCommand {
    Integer id
    MultipartFile contents

    static constraints = {
        id(nullable: false)
        contents(nullable: false)
    }
}

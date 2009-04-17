package scrumtime.organization

class OrganizationController {
    def organizationService

    def allowedMethods = [save: 'POST']

    def index = {
        def organization
        if (params.id) {
            organization = organizationService.findAuthorizedOrganization(session.currentUser, params.id)
            // TODO: remove below line after testing
            organization = Organization.get(params.id)

        } else if (!session.currentOrganization) {
            // Find Authorized Organizations for this user
            def organizations = organizationService.findAuthorizedOrganizations(session.currentUser)
            if (organizations)
                organization = organizations[0]
        }

        if (!organization) {
            redirect(action: "create")
        } else {
            if (organization.admins.contains(session.currentUser)) {
                render(view: '/projects/organization/general/index',
                    model: [mainMenuSelection: 'projects',
                        organization: organization, isEditable: true])
            } else {
                render(view: '/projects/organization/general/index',
                    model: [mainMenuSelection: 'projects',
                        organization: organization, isEditable: false])
            }
        }
    }

    def create = {
        def organization = loadOrCreateOrganization(params)

        render(view: '/projects/organization/general/create',
            model: [mainMenuSelection: 'projects',
                organization: organization])
    }

    def edit = {
        def organization = loadOrCreateOrganization(params)
        if (organization.admins.contains(session.currentUser)) {
            render(view: '/projects/organization/general/index',
                model: [mainMenuSelection: 'projects',
                    organization: organization, isEditable: true])
        } else {
            render(view: '/projects/organization/general/index',
                model: [mainMenuSelection: 'projects',
                    organization: organization, isEditable: false])
        }
    }

    def save = {
        def organization = loadOrCreateOrganization(params)
        organization.properties = params
        organization.name = organization?.name?.trim()
        organization.description = organization?.description?.trim()
        organization.validate()
        if (!organization.hasErrors()) {
            organization = organization.save(flush: true)
            render(view: '/projects/organization/general/index',
                model: [mainMenuSelection: 'projects',
                    organization: organization, isEditable: true])

        } else {
            render(view: '/projects/organization/general/create',
                model: [mainMenuSelection: 'projects',
                    organization: organization])
        }
    }

    private def loadOrCreateOrganization(def params) {
        Organization organization
        if (params?.id)
            organization = Organization.get(params.id)
        if (!organization)
            organization = new Organization(createdBy:'erniep888')
        return organization
    }
}

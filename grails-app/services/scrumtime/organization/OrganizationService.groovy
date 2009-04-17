package scrumtime.organization

import scrumtime.user.SystemUser

class OrganizationService {

    boolean transactional = true

    def save(Organization organization, String orgid) {
        if (!organization) {
            organization = new Organization()
        }

        if (orgid) {
            def existingOrg = Organization.get(orgid)
            existingOrg.name = organization.name
            existingOrg.description = organization.description
            if (existingOrg.validate()) {
                existingOrg.merge()
                organization = existingOrg
            } else {
                existingOrg.discard()
                organization.errors = existingOrg.errors
            }
        } else if (organization.validate()) {
            organization = organization.save()
        }

        return organization
    }

    def findAuthorizedOrganizations(SystemUser systemUser) {
        def results
        if (systemUser) {
            def query = "from scrumtime.organization.Organization as org " +
                "where :systemUser in elements(org.members)"
            results = Organization.findAll(query, [systemUser: systemUser])
        }
        return results
    }

    def findAuthorizedOrganization(SystemUser systemUser, def organizationId) {
        def result
        if (systemUser && organizationId) {
            def query = "from scrumtime.organization.Organization as org " +
                "where org.id = :orgId and :systemUser in elements(org.members)"
            result = Organization.findAll(query, [systemUser: systemUser,
                orgId: organizationId])
        }
        return result
    }
}
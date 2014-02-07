package org.scrumtime.controller

import grails.plugin.springsecurity.annotation.Secured

class SecureController {

    @Secured(['ROLE_ADMIN'])
    def index() {
        render 'secured controller'
    }
}

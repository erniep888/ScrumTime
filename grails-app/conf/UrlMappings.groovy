class UrlMappings {
    static mappings = {
        "/"(controller: "home", action: "index")
        "/init"(controller: "home", action: "init")
        "/$controller/$action?/$id?" {
            constraints {
                // apply constraints here
            }
        }
        "500"(view: '/error')
    }
}

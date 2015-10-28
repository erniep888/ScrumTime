class UrlMappings {
    static mappings = {
      "/" (controller:"status", action:"index")        
      "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }
	  "500"(view:'/error')
	}
}

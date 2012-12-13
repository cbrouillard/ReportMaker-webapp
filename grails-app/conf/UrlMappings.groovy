import com.headbangers.reportmaker.Report

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'Report', action: 'list')
        "500"(view: '/error')
    }
}

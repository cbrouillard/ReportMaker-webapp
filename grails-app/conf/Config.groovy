/**
 * Copyright (C) 2013 Cyril Brouillard <cyril.brouillard@gmail.com>
 *
 * This file is part of reportmaker.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

def ENV_NAME = "REPORTMAKER_CONF"
def props = new Properties()
if (System.getenv(ENV_NAME)) {
    InputStream is = new BufferedInputStream(new FileInputStream(System.getenv(ENV_NAME)))
    props.load(is)
    is.close()
}



grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
        all: '*/*',
        atom: 'application/atom+xml',
        css: 'text/css',
        csv: 'text/csv',
        form: 'application/x-www-form-urlencoded',
        html: ['text/html', 'application/xhtml+xml'],
        js: 'text/javascript',
        json: ['application/json', 'text/json'],
        multipartForm: 'multipart/form-data',
        rss: 'application/rss+xml',
        text: 'text/plain',
        xml: ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart = false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
        grails.serverURL = props.get("server.url")
    }
    production {
        grails.logging.jul.usebridge = false
        grails.serverURL = props.get("server.url")
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    appenders {
        console name: 'stdout', layout: pattern(conversionPattern: '%c{2} %m%n')
        rollingFile name: "myAppender",
                maxFileSize: 1024,
                file: "logs/twr.log"
    }

    root {
        info 'stdout', 'myAppender'
    }

    debug myAppender: 'com.headbangers', 'nl.jworks.akismet'

    error 'org.codehaus.groovy.grails.web.servlet', // controllers
            'org.codehaus.groovy.grails.web.pages', // GSP
            'org.codehaus.groovy.grails.web.sitemesh', // layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping', // URL mapping
            'org.codehaus.groovy.grails.commons', // core / classloading
            'org.codehaus.groovy.grails.plugins', // plugins
            'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate'
}

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'com.headbangers.reportmaker.Person'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'com.headbangers.reportmaker.PersonRole'
grails.plugins.springsecurity.authority.className = 'com.headbangers.reportmaker.Role'
//grails.plugins.springsecurity.portMapper.httpPort = 80
//grails.plugins.springsecurity.portMapper.httpsPort = 443
//grails.plugins.springsecurity.secureChannel.definition = [
//        '/web/**': 'REQUIRES_SECURE_CHANNEL',
//        '/**': 'REQUIRES_INSECURE_CHANNEL'
//]

grails.plugins.twitterbootstrap.fixtaglib = true

grails.mail.host = props.get("mail.host")
grails.mail.port = props.get("mail.port")
grails.mail.username = props.get("mail.username")
grails.mail.password = props.get("mail.password")
grails.mail.default.from = props.get("mail.default.from")

twr.photos.dir = props.get("twr.photos.dir")

// TODO externaliser
grails.mail.props = ["mail.smtp.auth": "true",
        "mail.smtp.socketFactory.port": "465",
        "mail.smtp.socketFactory.class": "javax.net.ssl.SSLSocketFactory",
        "mail.smtp.socketFactory.fallback": "false"]

//akismet {
//    key = props.get("twr.akismet.key")
//    site = props.get("server.url")
//    provider = "rest.akismet.com" // or api.antispam.typepad.com
//}
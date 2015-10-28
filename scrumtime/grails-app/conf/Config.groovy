/**
 *  Copyright 2008   scrumtime.org owners
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
**/
import com.octo.captcha.service.multitype.GenericManageableCaptchaService
import com.octo.captcha.engine.GenericCaptchaEngine
import com.octo.captcha.image.gimpy.GimpyFactory
import com.octo.captcha.component.word.wordgenerator.RandomWordGenerator
import com.octo.captcha.component.image.wordtoimage.ComposedWordToImage
import com.octo.captcha.component.image.fontgenerator.RandomFontGenerator
import java.awt.Font
import com.octo.captcha.component.image.backgroundgenerator.GradientBackgroundGenerator
import com.octo.captcha.component.image.color.SingleColorGenerator
import com.octo.captcha.component.image.textpaster.NonLinearTextPaster
import java.awt.Color

// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if(System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.types = [html: ['text/html', 'application/xhtml+xml'],
        xml: ['text/xml', 'application/xml'],
        text: 'text-plain',
        js: 'text/javascript',
        rss: 'application/rss+xml',
        atom: 'application/atom+xml',
        css: 'text/css',
        csv: 'text/csv',
        all: '*/*',
        json: ['application/json', 'text/json'],
        form: 'application/x-www-form-urlencoded',
        multipartForm: 'multipart/form-data'
]
// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"

// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true

// set per-environment serverURL stem for creating absolute links
environments {
    production {
        grails.serverURL = "http://www.scrumtime.org"
    }
}

// log4j configuration
log4j {
    appender.stdout = "org.apache.log4j.ConsoleAppender"
    appender.'stdout.layout' = "org.apache.log4j.PatternLayout"
    appender.'stdout.layout.ConversionPattern' = '[%r] %c{2} %m%n'
    appender.stacktraceLog = "org.apache.log4j.FileAppender"
    appender.'stacktraceLog.layout' = "org.apache.log4j.PatternLayout"
    appender.'stacktraceLog.layout.ConversionPattern' = '[%r] %c{2} %m%n'
    appender.'stacktraceLog.File' = "stacktrace.log"
    rootLogger = "error,stdout"
    logger {
        grails = "error"
        StackTrace = "error,stacktraceLog"
        org {
            codehaus.groovy.grails.web.servlet = "error"  //  controllers
            codehaus.groovy.grails.web.pages = "error" //  GSP
            codehaus.groovy.grails.web.sitemesh = "error" //  layouts
            codehaus.groovy.grails."web.mapping.filter" = "error" // URL mapping
            codehaus.groovy.grails."web.mapping" = "error" // URL mapping
            codehaus.groovy.grails.commons = "info" // core / classloading
            codehaus.groovy.grails.plugins = "error" // plugins
            codehaus.groovy.grails.orm.hibernate = "error" // hibernate integration
            springframework = "off"
            hibernate = "off"
        }
    }
    additivity.StackTrace = false
}
jcaptchas {
    imageCaptcha = new GenericManageableCaptchaService(
            new GenericCaptchaEngine(
                    new GimpyFactory(
                            new RandomWordGenerator(
                                    "abcdefghijklmnpqrstuvwxyz123456789"
                            ),
                            new ComposedWordToImage(
                                    new RandomFontGenerator(
                                            14, // min font size
                                            22, // max font size
                                            [new Font("sansserif", 0, 0),
                                                    new Font("monospaced", 0, 0)] as Font[]
                                    ),
                                    new GradientBackgroundGenerator(
                                            100, // width
                                            22, // height
                                            new SingleColorGenerator(new Color(150, 110, 120)),
                                            new SingleColorGenerator(new Color(230, 220, 220))
                                    ),
                                    new NonLinearTextPaster(
                                            4, // minimal length of text
                                            5, // maximal length of text
                                            new Color(240, 240, 80)
                                    )
                            )
                    )
            ),
            180, // minGuarantedStorageDelayInSeconds
            180000 // maxCaptchaStoreSize
    )
}

grails {
    mail {
        host = "myoutbound.smtp"
        port = 25
        username = "myuserId"
        password = "mypassword"
        props = ["mail.smtp.auth": "true",
                "mail.smtp.socketFactory.port": "25",
                "mail.smtp.socketFactory.class": "javax.net.SocketFactory",
                "mail.smtp.socketFactory.fallback": "true"]

    }
}



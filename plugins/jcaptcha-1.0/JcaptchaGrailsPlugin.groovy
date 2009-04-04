/**
 * Simplest. Plugin. Class. Ever.
 * 
 * @author LD <ld@ldaley.com>
 */
class JcaptchaGrailsPlugin {
	def title = "Grails JCaptcha Plugin"
	def description = 'Makes using JCaptcha within a Grails app simple'
	def author = "Luke Daley"
	def authorEmail = "ld@ldaley.com"
	def documentation = "http://grails.org/JCaptcha+Plugin"
	
	def version = "1.0"
	def dependsOn = [:]
	
	def doWithSpring = { }
	def doWithApplicationContext = { applicationContext -> }
	def doWithWebDescriptor = { xml -> }
	def doWithDynamicMethods = { ctx -> }
	def onChange = { event -> }
	def onApplicationChange = { event -> }
}

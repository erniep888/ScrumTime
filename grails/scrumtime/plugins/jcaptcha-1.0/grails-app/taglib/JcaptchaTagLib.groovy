/**
 * Some convenience tags for 'displaying' captcha challenges. 
 * 
 * @author LD <ld@ldaley.com>
 */
class JcaptchaTagLib 
{
	/**
	 * All tags are <jcaptcha:* />
	 */
	static namespace = 'jcaptcha'
	
	/**
	 * Insert an 'img' tag with a JPEG image challenge.
	 * 
	 * Example:
	 * 	<jcaptcha:jpeg name="myImageCaptcha" height="40px" width="40px" />
	 * 
	 * All attributes are valid except "name" and "src", they will be filtered.
	 */
	def jpeg = {
		def link = g.createLink(controller: "jcaptcha", action: "jpeg", id: it.name)
		def attributes = []
		it.each { key, value -> if (key != "name" && key != "src") attributes << "${key}=\"${value}\"" }
		out << "<img src=\"${link}\" ${attributes.join(' ')} />"
	}

	/**
	 * Insert an 'embed' tag with a WAV image challenge.
	 * 
	 * Example:
	 * 	<jcaptcha:wav name="mySoundCaptcha" autostart="0" />
	 * 
	 * All attributes are valid except "name", "src" and "type", they will be filtered.
	 * 
	 * type="audio/x-wav" will be added to the tag.
	 */	
	def wav = {
		def link = g.createLink(controller: "jcaptcha", action: "wav", id: it.name)
		def attributes = []
		it.each { key, value -> if (key != "name" && key != "src" & key != "type") attributes << "${key}=\"${value}\"" }
		out << "<embed src=\"${link}\" type=\"audio/x-wav\" ${attributes.join(' ')} />"
	}
}
import java.awt.image.BufferedImage;
import javax.sound.sampled.AudioInputStream;

/**
 * Exposes actions that 'render' captcha challenges.
 * 
 * The 'id' used to identify the challenge is session.id. Therefore you need to use session.id when validating a response.
 * 
 * You typically won't need to use this class directly, take a look at the JcaptchaTabLib.
 * 
 * @author LD <ld@ldaley.com>
 */
class JcaptchaController 
{
	def jcaptchaService
	
	def captcha
	def captchaName
	def challenge
	def data
	
	def beforeInterceptor = {
		if (params.id == null) throw new IllegalStateException("JcaptchaController action called with no id (captcha name)")
		captchaName = params.id
		captcha = jcaptchaService.getCaptchaService(captchaName)
		challenge = captcha.getChallengeForID(session.id, request.locale)
	}
	
	def jpeg = {
		
		if (challenge instanceof BufferedImage)
		{
			response.contentType = "image/jpeg"
			data = jcaptchaService.challengeAsJpeg(challenge)
		}
		else
		{
			throw new IllegalArgumentException("Cannot render challenge ofcaptcha '${captchaName}' as JPEG as it is not an image")
		}
	}
	
	def wav = {
		if (challenge instanceof AudioInputStream)
		{
			response.contentType = "audio/x-wav"
			data = jcaptchaService.challengeAsWav(challenge)
		}
		else
		{
			throw new IllegalArgumentException("Cannot render challenge of captcha '${captchaName}' as WAV as it is not audio")
		}
	}
	
	def afterInterceptor = {
		response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate,max-age=0")
		response.setHeader("Content-Length", data.length as String)
		response.setDateHeader("Expires", 0)
		response.outputStream.write(data)
		response.outputStream.flush()
		response.outputStream.close()
	}
}
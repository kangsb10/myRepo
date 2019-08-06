package kr.or.ddit.cropsdoctor.utiles;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.Security;
import java.security.spec.InvalidKeySpecException;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpResponse;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.jose4j.lang.JoseException;

import nl.martijndwars.webpush.Notification;
import nl.martijndwars.webpush.PushService;
import nl.martijndwars.webpush.Subscription;

public class PWAUtil {

	private static final String publicKey = "BNK2u9_Ngs4bhLBoexOQ4axO1IuY3VDgPIuXKo8p71u4-jVssd1QW-beLLXcMD6JYzU_MmgdFwsB0mHU4riM4Ng";
	private static final String privateKey = "bUbAbXasRKCogKH01-qA54gC410oY7mrQ-GGAFp5zSk";
	
	/**
	 * 
	 * @param sub
	 * @param payload
	 * @return
	 */
	public boolean sendMessage(Subscription sub, String payload) {
		
		boolean result = true;
		
		if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
			Security.addProvider(new BouncyCastleProvider());
		}
		
		PushService pushService = null;
		try {
			pushService = new PushService(publicKey, privateKey, "testSubject");
		} catch (GeneralSecurityException e1) {
			e1.printStackTrace();
		}
		
		Notification notification = null;
		try {
			notification = new Notification(sub, payload);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		}
		System.out.println(notification.isFcm());
		
		HttpResponse resp = null;
		
		try {
			resp = pushService.send(notification);
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JoseException e) {
			e.printStackTrace();
		} catch (ExecutionException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		
		int statusCode =  resp.getStatusLine().getStatusCode();
		String reasonPhrase = resp.getStatusLine().getReasonPhrase();
		
		System.out.println("statusCode : " + statusCode);
		System.out.println("reasonPhrase : " + reasonPhrase);
		
		if(statusCode >= 400) {
			result = false;
		}
		
		return result;
	}
	
	public String getReqParams(HttpServletRequest request) throws IOException {
		
		String body = null;
        StringBuilder stringBuilder = new StringBuilder();
        BufferedReader bufferedReader = null;
 
        try {
            InputStream inputStream = request.getInputStream();
            if (inputStream != null) {
                bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
                char[] charBuffer = new char[128];
                int bytesRead = -1;
                while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
                    stringBuilder.append(charBuffer, 0, bytesRead);
                }
            }
        } catch (IOException ex) {
            throw ex;
        } finally {
            if (bufferedReader != null) {
                try {
                    bufferedReader.close();
                } catch (IOException ex) {
                    throw ex;
                }
            }
        }
		
        body = stringBuilder.toString();
        
        return body;
		
	}
	
}

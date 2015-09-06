package edu.msc.fts.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Service;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Formatter;

/**
 * Created by harshadura on 11/27/14.
 */
@Service
public class NotificationService {

    @Autowired
    private TaskExecutor taskExecutor;

    /**
     * @param message
     */
    public void sendMessage(final String message, final String number) throws IOException {
        taskExecutor.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    messageSender(message, number);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        });
    }

    public void sendEmail(final String subject, final String content, final String toEmail) throws IOException {
        taskExecutor.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    emailSender(toEmail, content, subject);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    private void messageSender(String message, String number) throws IOException {
        message = message.trim();
        number = number.trim();

        System.out.println("**** SENDING SMS : " + number + " , " + message);

        /////////

        String shoutout_apikey = "183f50d5-1728-40b1-a677-43ad3524f523";
        String shoutout_secret = "853c679b-9ff0-490f-b413-aca477d1ff52";
        String shoutout_senderid = "ShoutOUT";

        String url = "http://apps.sqrmobile.com:8080/shoutout-restservicev4/rest/message/sms?message="
                + URLEncoder.encode(message, "UTF-8") + "&msisdn=" +
                URLEncoder.encode(number, "UTF-8") + "&source=" + shoutout_senderid +
                "&apikey=" + shoutout_apikey +
                "&key=" + calcShaHash(shoutout_senderid + message, shoutout_secret);

        ////////

        //System.out.println(url);
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();

// optional default is GET
        con.setRequestMethod("GET");
//add request header
        int responseCode = con.getResponseCode();
        System.out.println("\nSending 'GET' request to URL : " + url);
        System.out.println("Response Code : " + responseCode);
        BufferedReader in = new BufferedReader(
                new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();
//print result
        System.out.println(response.toString());
    }


    /**
     * Calculate Key
     *
     * @param data
     * @param key
     * @return
     */
    private String calcShaHash(String data, String key) {

        String HMAC_SHA1_ALGORITHM = "HmacSHA1";

        String result = null;

        try {

            SecretKeySpec signingKey = new SecretKeySpec(key.getBytes(),

                    HMAC_SHA1_ALGORITHM);

// get an hmac_sha1 Mac instance and initialize with the signing key

            Mac mac = Mac.getInstance(HMAC_SHA1_ALGORITHM);

            mac.init(signingKey);

// compute the hmac on input data bytes

            byte[] rawHmac = mac.doFinal(data.getBytes());

// base64­encode the hmac

            Formatter formatter = new Formatter();

            for (byte b : rawHmac) {
                formatter.format("%02x", b);
            }
            result = formatter.toString();

        } catch (NoSuchAlgorithmException e) {

        } catch (InvalidKeyException e) {

        } catch (IllegalStateException e) {

        }

        return result;
    }


        public void emailSender(String toEmail, String messageContent, String subject) {

            final String username = "mscfts@gmail.com";
            final String password = "mobile$123";

            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");

            Session session = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, password);
                        }
                    });

            try {

                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress("msc-shipping-alerts@gmail.com"));
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(toEmail));
                message.setSubject(subject);
                message.setText(messageContent);

                Transport.send(message);

                System.out.println("**** SENDING EMAIL : " + toEmail + " , " + messageContent + " , " + subject);

            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
    }
}

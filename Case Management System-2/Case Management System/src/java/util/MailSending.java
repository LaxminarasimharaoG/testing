package util;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class MailSending 
{
        
    public static boolean emailSending(String toAddress,String subject,String msg)
    {
        final String username = "casemgmt17@gmail.com";
        final String password = "casemgmt17welcome";
        
        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        
        
        Session session = Session.getInstance(props,
          new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() 
            {
                return new PasswordAuthentication(username, password);
            }
          });

        try 
        {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(toAddress));
            message.setSubject(subject);
            message.setText(msg);
            
            Transport.send(message);
        } 
        catch (MessagingException e) 
        {
            throw new RuntimeException(e);
        }
        
        return true;
    }   
}

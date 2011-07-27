
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bst.sscorp.util.mail;

import com.bst.sscorp.formclasses.mail.MailerForm;
import com.bst.sscorp.util.PropertiesUtil;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author bhaskar
 * @date 21 Nov 2009
 */
public class SscorpMailUtil {

    /**
     * 
     * @param mailerForm
     * @throws java.lang.Exception
     * @throws javax.mail.MessagingException
     */
    public static void sendMail(MailerForm mailerForm) throws Exception, MessagingException{
        if(!isEverythingSet(mailerForm)){
            throw new Exception("Could not send mail.");
        }

        HashMap<String, String> mailingPropMap = PropertiesUtil.readPropertyFile("mail-config");

        Properties properties = new Properties();

        Authenticator authenticator = new SMTPAuthenticator(mailingPropMap.get("smtp.auth.user"),
                                                mailingPropMap.get("smtp.auth.passwd"));

        mailingPropMap.remove("smtp.auth.user");
        mailingPropMap.remove("smtp.auth.passwd");

        String key = null;
        Iterator<String> mailPropItr = mailingPropMap.keySet().iterator();
        while(mailPropItr.hasNext()){
            key = mailPropItr.next();
            properties.setProperty(key, mailingPropMap.get(key));
        }
        
        Session session = Session.getDefaultInstance(properties, authenticator);

        InternetAddress[] addresTo = new InternetAddress[mailerForm.getTo().length];
        for(int count = 0; count < mailerForm.getTo().length; count++){
            addresTo[count] = new InternetAddress(mailerForm.getTo()[count]);
        }

        MimeMessage mimeMessage = new MimeMessage(session);

        mimeMessage.setRecipients(Message.RecipientType.TO, addresTo);
        mimeMessage.setFrom(new InternetAddress(mailerForm.getFrom()));
        mimeMessage.setSubject(mailerForm.getSubject());

        //TODO: header information not complete
        if(mailerForm.getHeader() != null){
            mimeMessage.setHeader(mailerForm.getHeader(), mailerForm.getHeader());
        }

        mimeMessage.setContent(mailerForm.getMessage(), "text/plain");

        Transport.send(mimeMessage);
    }

    /**
     * 
     * @param mailerForm
     * @return
     */
    private static boolean isEverythingSet(MailerForm mailerForm){
        if(mailerForm.getTo() == null || mailerForm.getFrom() == null || mailerForm.getSubject() == null ||
            mailerForm.getMessage() == null){

            return false;
        }

        for(int count = 0; count < mailerForm.getTo().length; count++){
            if(mailerForm.getTo()[count].toString().indexOf("@") == -1 || 
                 mailerForm.getTo()[count].toString().indexOf(".") == -1){

                return false;
            }
        }

        if(mailerForm.getFrom().toString().indexOf("@") == -1 ||
                mailerForm.getFrom().toString().indexOf(".") == -1){
            return false;
        }
        return true;
    }
}

/**
 * 
 * @author bhaskar
 */
class SMTPAuthenticator extends Authenticator{
    
    String userName;
    String password;

    /**
     * 
     * @param userName
     * @param password
     */
    public SMTPAuthenticator(String userName, String password){
        this.userName = userName;
        this.password = password;
    }

    @Override
    public PasswordAuthentication getPasswordAuthentication(){

//        PropertiesUtil.readProperty("mail-config", "smtp.auth.user");
//        String password = PropertiesUtil.readProperty("mail-config", "smtp.auth.passwd");
        
        return new PasswordAuthentication(userName, password);
    }
}



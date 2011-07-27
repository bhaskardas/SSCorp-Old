/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bst.sscorp.formclasses.mail;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author bhaskar
 * @date 24 Nov 2009
 */
public class MailerForm extends ActionForm{

    private String[] to;
    private String from;
    private String subject;
    private String message;
    private String header;


    /**
     * @return the subject
     */
    public String getSubject() {
        return subject;
    }

    /**
     * @param subject the subject to set
     */
    public void setSubject(String subject) {
        this.subject = subject;
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * @return the header
     */
    public String getHeader() {
        return header;
    }

    /**
     * @param header the header to set
     */
    public void setHeader(String header) {
        this.header = header;
    }

    /**
     * @return the to
     */
    public String[] getTo() {
        return to;
    }

    /**
     * @param to the to to set
     */
    public void setTo(String[] to) {
        this.to = to;
    }

    /**
     * @return the from
     */
    public String getFrom() {
        return from;
    }

    /**
     * @param from the from to set
     */
    public void setFrom(String from) {
        this.from = from;
    }

    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        this.from = "";
        this.header = "";
        this.message = "";
        this.subject = "";
        this.to = null;
    }


}

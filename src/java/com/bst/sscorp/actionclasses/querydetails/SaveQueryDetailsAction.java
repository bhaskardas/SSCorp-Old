/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bst.sscorp.actionclasses.querydetails;

import com.bst.sscorp.dbaccess.SSCorpDAO;
import com.bst.sscorp.entities.companyprofile.SscorpCompanyProfileM;
import com.bst.sscorp.entities.customerdetails.SscorpCustomerDetailsT;
import com.bst.sscorp.entities.querydetails.SscorpQueryDetailsT;
import com.bst.sscorp.formclasses.mail.MailerForm;
import com.bst.sscorp.formclasses.querydetails.QueryDetailsForm;
import com.bst.sscorp.util.HibernateSessionFactory;
import com.bst.sscorp.util.mail.SscorpMailUtil;
import java.util.Date;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author bhaskar
 * @date 18 Nov 2009
 */
public class SaveQueryDetailsAction extends Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        String target = "showMessage";
        Session hibernateSession = null;
        Transaction transaction = null;

        try {
            QueryDetailsForm saveQueryDetailsForm = (QueryDetailsForm) form;

            hibernateSession = HibernateSessionFactory.getSessionFactory().openSession();

            if (hibernateSession != null) {
                transaction = hibernateSession.beginTransaction();

                if (saveQueryDetailsForm != null) {
                    SscorpCustomerDetailsT sscorpCustomerDetailsT = setCustomerDetails(saveQueryDetailsForm);
                    SscorpQueryDetailsT sscorpQueryDetailsT = setQueryDetails(saveQueryDetailsForm, sscorpCustomerDetailsT,
                            (SscorpCompanyProfileM) request.getSession().getAttribute("companyProfile"));

                    SSCorpDAO.insertCustomerDetails(sscorpCustomerDetailsT, hibernateSession);
                    SSCorpDAO.insertQueryDetails(sscorpQueryDetailsT, hibernateSession);

                    sendMail(saveQueryDetailsForm,
                            ((SscorpCompanyProfileM) request.getSession().getAttribute("companyProfile")).getEmailId());
                    transaction.commit();
                    request.setAttribute("message", "Your query has been submitted. We'll get back to you with an answer very shortly. Thank you.");
                } else {
                    throw new Exception("Save Error. No data received.");
                }
            } else {
                target = "failure";
                throw new Exception("Database Connection Error");
            }
        } catch (MessagingException me) {
            transaction.rollback();
            request.setAttribute("message", me.getMessage() + ". \nPlease try after some time");
            me.printStackTrace();
        } catch (Exception e) {
            transaction.rollback();
            request.setAttribute("message", e.getMessage() + ". \nPlease try after some time");
            e.printStackTrace();
        } finally {
            hibernateSession.close();
        }

        return mapping.findForward(target);
    }

    /**
     *
     * @param saveQueryForm
     * @throws java.lang.Exception
     * @throws javax.mail.MessagingException
     */
    private void sendMail(QueryDetailsForm saveQueryForm, String recipientEmailId) throws Exception, MessagingException {
        MailerForm mailerForm = new MailerForm();

        mailerForm.setFrom(saveQueryForm.getEmailId());
        String[] toEmailId = {recipientEmailId};
        mailerForm.setTo(toEmailId);
        mailerForm.setSubject(saveQueryForm.getSubject());
        StringBuffer messageBuffer = new StringBuffer();
        messageBuffer.append("From : ");
        messageBuffer.append(saveQueryForm.getEmailId());
        messageBuffer.append("\n\n");
        messageBuffer.append("Subject: ");
        messageBuffer.append(saveQueryForm.getSubject());
        messageBuffer.append("\n");
        messageBuffer.append("Date: ");
        messageBuffer.append(new Date());
        messageBuffer.append("\n");
        messageBuffer.append("Query: ");
        messageBuffer.append(saveQueryForm.getQueryString());
        mailerForm.setMessage(messageBuffer.toString());

        SscorpMailUtil.sendMail(mailerForm);
    }

    /**
     *
     * @param customerDetailsForm
     * @param sscorpAddressM
     * @return
     */
    private SscorpCustomerDetailsT setCustomerDetails(QueryDetailsForm queryDetailsForm) {

        SscorpCustomerDetailsT sscorpCustomerDetailsT = new SscorpCustomerDetailsT();

        sscorpCustomerDetailsT.setEmailId(queryDetailsForm.getEmailId());
        sscorpCustomerDetailsT.setGender(queryDetailsForm.getGender());
        sscorpCustomerDetailsT.setFirstName(queryDetailsForm.getFirstName());
        sscorpCustomerDetailsT.setLastName(queryDetailsForm.getLastName());
        sscorpCustomerDetailsT.setCompanyName(queryDetailsForm.getCompanyName());
        sscorpCustomerDetailsT.setCompanyWebsite(queryDetailsForm.getCompanyWebsite());
        sscorpCustomerDetailsT.setPhoneNo(queryDetailsForm.getPhoneNo());
        sscorpCustomerDetailsT.setMobileNo(queryDetailsForm.getMobileNo());

        return sscorpCustomerDetailsT;
    }

    /**
     *
     * @param saveQueryDetailsForm
     * @param sscorpCustomerDetailsT
     * @return
     * @throws java.lang.Exception
     */
    private SscorpQueryDetailsT setQueryDetails(QueryDetailsForm saveQueryDetailsForm,
            SscorpCustomerDetailsT sscorpCustomerDetailsT,
            SscorpCompanyProfileM sscorpCompanyProfileM) throws Exception {

        SscorpQueryDetailsT sscorpQueryDetailsT = null;

        if (saveQueryDetailsForm != null) {
            sscorpQueryDetailsT = new SscorpQueryDetailsT();

            sscorpQueryDetailsT.setSscorpCustomerDetailsT(sscorpCustomerDetailsT);
            sscorpQueryDetailsT.setQuery(saveQueryDetailsForm.getQueryString());
            sscorpQueryDetailsT.setQuerySubject(saveQueryDetailsForm.getSubject() != null ? saveQueryDetailsForm.getSubject() : "-");
            sscorpQueryDetailsT.setQueryDate(new Date());
            sscorpQueryDetailsT.setHearAboutUs(saveQueryDetailsForm.getHearAboutUs());
            sscorpQueryDetailsT.setSscorpCompanyProfileM(sscorpCompanyProfileM);
        }

        return sscorpQueryDetailsT;
    }
}

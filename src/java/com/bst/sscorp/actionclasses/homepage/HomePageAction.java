/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bst.sscorp.actionclasses.homepage;

import com.bst.sscorp.dbaccess.SSCorpDAO;
import com.bst.sscorp.entities.companyprofile.SscorpCompanyProfileM;
import com.bst.sscorp.formclasses.general.GeneralForm;
import com.bst.sscorp.util.HibernateSessionFactory;
import com.bst.sscorp.util.SSCorpUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;

/**
 *
 * @author bhaskar
 * @created on 21 Dec 2009
 */
public class HomePageAction extends Action{

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
                                    throws Exception {

        Session hibernateSession = null;

        try{
            hibernateSession = HibernateSessionFactory.getSessionFactory().openSession();

            Integer companyId = ((SscorpCompanyProfileM)request.getSession().getAttribute("companyProfile")).getCompanyId();
            
            if(((SscorpCompanyProfileM)request.getSession().getAttribute("companyProfile")).getAboutUs() != null)
                request.setAttribute("aboutUs", ((SscorpCompanyProfileM)request.getSession().getAttribute("companyProfile")).getAboutUs());
            else{
                String aboutUs = SSCorpDAO.fetchAboutUsInfo(hibernateSession, companyId);
                if(aboutUs != null)
                    request.setAttribute("aboutUs", aboutUs);
            }

           //Get the contact details
           ArrayList<GeneralForm> populatedList = SSCorpUtil.fetchContactDetails(hibernateSession, companyId);
           if(populatedList != null && populatedList.size() > 0)
               request.setAttribute("contactDetails", populatedList);

           //Get the mobile numbers
//           populatedList = SSCorpUtil.fetchMobileNumbers(hibernateSession, companyId);
//           if(populatedList != null && populatedList.size() > 0)
//                request.setAttribute("mobileNumberList", populatedList);

        }catch(Exception e){
            e.printStackTrace();
        }finally{
            hibernateSession.close();
        }

        return mapping.findForward("success");
    }
}

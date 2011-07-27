/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bst.sscorp.actionclasses.companyprofile;

import com.bst.sscorp.dbaccess.SSCorpDAO;
import com.bst.sscorp.entities.companyprofile.SscorpCompanyProfileM;
import com.bst.sscorp.formclasses.achievements.AchievementsForm;
import com.bst.sscorp.util.HibernateSessionFactory;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;

/**
 * @author bhaskar
 */
public class CompanyProfileAction extends Action{

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        String target = "showPage";

        Session hibernateSession = null;
        try{
            hibernateSession = HibernateSessionFactory.getSessionFactory().openSession();
            Integer companyId = ((SscorpCompanyProfileM)request.getSession().getAttribute("companyProfile")).getCompanyId();

            //Get the data for aboutUs from the SSCorpCompanyProfileM object set in session.
            //If not found in session, query from db.
            if(((SscorpCompanyProfileM)request.getSession().getAttribute("companyProfile")).getAboutUs() != null){
                request.setAttribute("aboutUs", ((SscorpCompanyProfileM)request.getSession().getAttribute("companyProfile")).getAboutUs());
            }else{
                String aboutUs = SSCorpDAO.fetchAboutUsInfo(hibernateSession, companyId);
                if(aboutUs != null)
                    request.setAttribute("aboutUs", aboutUs);
            }

            //Get the data for infrastructure and manufacturing from SSCorpCompanyProfileM.
            //If the required value is not found in session, then query the specific field
            //from session.
            if(((SscorpCompanyProfileM)request.getSession().getAttribute("companyProfile")).getInfrastructure() != null){
                request.setAttribute("infrastructure", ((SscorpCompanyProfileM)request.getSession().getAttribute("companyProfile")).getInfrastructure());
            }else{
                String infrastructure = SSCorpDAO.fetchInfrastructureInfo(hibernateSession, companyId);
                if(infrastructure != null)
                    request.setAttribute("infrastructure", infrastructure);
            }

            //Get the Main achievements description from SSCorpCompanyProfileM. If not found in session
            //query from the db.
            if(((SscorpCompanyProfileM)request.getSession().getAttribute("companyProfile")).getAchievmentsDesc() != null){
                request.setAttribute("achievmentsHeading", ((SscorpCompanyProfileM)request.getSession().getAttribute("companyProfile")).getAchievmentsDesc());
            }else{
                String achievmentsHeading = SSCorpDAO.fetchAchievementDesc(hibernateSession, companyId);
                if(achievmentsHeading != null)
                    request.setAttribute("achievmentsHeading", achievmentsHeading);
            }

            //Get the main list of achievements from the SSCorpAchievements table and set
            //it in the form object to be displayed in the jsp.
            List<Object[]> achievementsList = SSCorpDAO.fetchAchievements(hibernateSession, companyId);
            if(achievementsList != null && achievementsList.size() > 0){
                ArrayList<AchievementsForm> achievementsFormsList = populateAchievementsForm(achievementsList);
                if(achievementsFormsList != null && achievementsFormsList.size() > 0)
                    request.setAttribute("achievementList", achievementsFormsList);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
            hibernateSession.close();
        }

        return mapping.findForward(target);
    }

    /**
     * 
     * @param achievementsList
     * @return
     */
    private ArrayList<AchievementsForm> populateAchievementsForm(List<Object[]> achievementsList){
        ArrayList<AchievementsForm> achievementsFormList = new ArrayList<AchievementsForm>();
        AchievementsForm achievementsForm = null;

        for(int count = 0; count < achievementsList.size(); count++){
            achievementsForm = new AchievementsForm();

            achievementsForm.setAchievementName(((Object[])achievementsList.get(count))[0] != null ? ((Object[])achievementsList.get(count))[0].toString() : "-");
            achievementsForm.setAchievementDesc(((Object[])achievementsList.get(count))[1] != null ? ((Object[])achievementsList.get(count))[1].toString() : "-");

            achievementsFormList.add(achievementsForm);
        }

        return achievementsFormList;
    }
}

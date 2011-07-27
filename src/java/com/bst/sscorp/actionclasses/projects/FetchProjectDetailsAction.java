/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bst.sscorp.actionclasses.projects;

import com.bst.sscorp.dbaccess.SSCorpDAO;
import com.bst.sscorp.entities.companyprofile.SscorpCompanyProfileM;
import com.bst.sscorp.entities.projects.SscorpProjectCategoryM;
import com.bst.sscorp.formclasses.general.GeneralForm;
import com.bst.sscorp.util.HibernateSessionFactory;
import com.bst.sscorp.util.PropertiesUtil;
import com.bst.sscorp.util.SSCorpUtil;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
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
 */
public class FetchProjectDetailsAction extends Action{

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Session hibernateSession = null;
        try{
            GeneralForm generalForm = (GeneralForm)form;

            hibernateSession = HibernateSessionFactory.getSessionFactory().openSession();
            Integer companyId = ((SscorpCompanyProfileM)request.getSession().getAttribute("companyProfile")).getCompanyId();
            
            List<SscorpProjectCategoryM> projCategoryList = null;

            if(request.getSession().getAttribute("projCategoryList") == null){
                projCategoryList = SSCorpDAO.fetchProjectCategory(hibernateSession,  companyId);
                if(projCategoryList != null && projCategoryList.size() > 0){
                    request.getSession().setAttribute("projCategoryList", projCategoryList);
                }
            }else{
                projCategoryList = (List<SscorpProjectCategoryM>)request.getSession().getAttribute("projCategoryList");
            }

            if(request.getSession().getAttribute("projectMap") == null ||
                    request.getParameter("linkClicked") == null){

                List<Object[]> projectInfoList = null;

                if(generalForm.getSelectedProjCategory() != null && !generalForm.getSelectedProjCategory().equals("")){
                    projectInfoList = SSCorpDAO.fetchProjectInfo(hibernateSession, Integer.parseInt(generalForm.getSelectedProjCategory()), companyId);

                }else if(generalForm.getSelectedProjCategory().equals("")){
                    projectInfoList = SSCorpDAO.fetchProjectInfo(hibernateSession, null, companyId);
                }

                if(projectInfoList != null && projCategoryList != null &&
                                    projectInfoList.size() > 0 && projCategoryList.size() > 0){

                    if(request.getSession().getAttribute("projectMap") != null)
                        request.getSession().removeAttribute("projectMap");

                    if(request.getSession().getAttribute("projectMapSize") != null)
                        request.getSession().removeAttribute("projectMapSize");

                    LinkedHashMap<String, HashMap<String, String>> projectMap = populateProjectData(projectInfoList, projCategoryList);

                    if(projectMap != null && projectMap.size() > 0){
                        request.getSession().setAttribute("projectMap", projectMap);
                        request.getSession().setAttribute("projectMapSize", projectMap.size());
                    }
                }
            }

            Integer projectMapSize = request.getSession().getAttribute("projectMapSize") != null ?
                                        Integer.parseInt(request.getSession().getAttribute("projectMapSize").toString()) : null;

            Integer offset = request.getParameter("offset") != null ? Integer.parseInt(request.getParameter("offset").toString()) : null;

            Integer pageLength = Integer.parseInt(PropertiesUtil.readProperty("ApplicationResource", "projectList.paging.pageLength"));

            offset = SSCorpUtil.setOffset4Pagination(offset, request.getParameter("linkClicked"),
                                                                            projectMapSize, pageLength);

            request.setAttribute("projectPageLength", pageLength);
			request.setAttribute("offset", offset);

        }catch(Exception e){
            e.printStackTrace();
        }finally{
            hibernateSession.close();
        }
        return mapping.findForward("showProjectList");
    }

    /**
     *
     * @param projectInfoList
     * @param projCategoryList
     * @return
     * @throws java.lang.Exception
     */
    private LinkedHashMap<String, HashMap<String, String>> populateProjectData(List<Object[]> projectInfoList,
                                                List<SscorpProjectCategoryM> projCategoryList) throws Exception{

        LinkedHashMap<String, HashMap<String, String>> projectMap = new LinkedHashMap<String, HashMap<String, String>>();
        LinkedHashMap<String, String> projectNameMap = null;

        SscorpProjectCategoryM sscorpProjectCategoryM = null;
        Integer count2 = 0;
        Integer projCategoryId = null;
        String city = null;

        for(Integer count = 0; count < projCategoryList.size(); count++){
            sscorpProjectCategoryM = projCategoryList.get(count);
            projCategoryId = sscorpProjectCategoryM.getProjectCatId();

            projectNameMap = new LinkedHashMap<String, String>();
            while(count2 < projectInfoList.size() &&
                    projCategoryId == Integer.parseInt(((Object[])projectInfoList.get(count2))[0] != null ? ((Object[])projectInfoList.get(count2))[0].toString() : "0")){


                city = ((Object[])projectInfoList.get(count2))[2] != null &&
                       ((Object[])projectInfoList.get(count2))[2].toString().length() > 1 ?
                        ((Object[])projectInfoList.get(count2))[2].toString() + ", " : "";

                if(((Object[])projectInfoList.get(count2))[3] != null &&
                        ((Object[])projectInfoList.get(count2))[3].toString().length() > 1){

                    city += ((Object[])projectInfoList.get(count2))[3].toString();
                }else{
                    city = ((Object[])projectInfoList.get(count2))[2].toString();
                }

                projectNameMap.put(((Object[])projectInfoList.get(count2))[1] != null ? ((Object[])projectInfoList.get(count2))[1].toString() : "", city);

                count2++;
            }

            if(projectNameMap.size() > 0)
                projectMap.put(sscorpProjectCategoryM.getProjectCategory(), projectNameMap);
        }

        return projectMap;
    }
}

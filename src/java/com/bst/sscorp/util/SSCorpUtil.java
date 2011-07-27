/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bst.sscorp.util;

import com.bst.sscorp.dbaccess.SSCorpDAO;
import com.bst.sscorp.entities.companyprofile.SscorpCompanyProfileM;
import com.bst.sscorp.formclasses.general.GeneralForm;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import org.hibernate.Session;

/**
 * @author bhaskar
 */
public class SSCorpUtil {

    /**
     * Get the entire company info from db.
     * @return
     * @throws java.lang.Exception
     */
    public static SscorpCompanyProfileM fetchCompanyProfileInfo() throws Exception{
        Session hibernateSession = null; 
        SscorpCompanyProfileM sscorpCompanyProfileM = null;
        try{
            hibernateSession = HibernateSessionFactory.getSessionFactory().openSession();
            sscorpCompanyProfileM = SSCorpDAO.fetchCompanyProfileInfo(hibernateSession);
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            hibernateSession.close();
        }

        return sscorpCompanyProfileM;
    }

    /**
     * Get the tab menus from db.
     * @param companyId
     * @return
     * @throws java.lang.Exception
     */
    public static ArrayList<LinkedHashMap<String, String>> fetchTabMenu(Integer companyId) throws Exception{
        Session hibernateSession = null;
        LinkedHashMap<String, String> menuMap = null;
        LinkedHashMap<String, String> additionalMenuUrlMap  = null;
        ArrayList<LinkedHashMap<String, String>> menuDataList = new ArrayList<LinkedHashMap<String, String>>();

        try{
            hibernateSession = HibernateSessionFactory.getSessionFactory().openSession();
            List<Object[]> menuListObj = SSCorpDAO.fetchMenuInfo(hibernateSession, companyId);
            if(menuListObj != null && menuListObj.size() > 0){
                menuMap = formatMenuData(menuListObj, null);
                additionalMenuUrlMap = formatAddtionalMenuData(menuListObj);
            }

            menuDataList.add(menuMap);
            menuDataList.add(additionalMenuUrlMap);
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            hibernateSession.close();
        }

        return menuDataList;
    }

    /**
     * set the menu information in the required format.
     * @param menuList
     * @return
     */
    private static LinkedHashMap<String, String> formatMenuData(List<Object[]> menuList, Integer index){
        
        LinkedHashMap<String, String> menuMap  = new LinkedHashMap<String, String>();

        if(index == null)
            index = 1;
        
        Object[] tempObj = null;

        for(int count = 0; count < menuList.size(); count++){
            tempObj = menuList.get(count);
            if(tempObj != null){
                menuMap.put(tempObj[0].toString(), tempObj[index] != null ? tempObj[index].toString() : "");
            }
        }

        System.out.println(":::::::::::::::::::::::::::>>>>>>" + menuMap);

        return menuMap;
    }

    /**
     * sets additonal url under a menu
     * @param menuList
     * @return
     */
    private static LinkedHashMap<String, String> formatAddtionalMenuData(List<Object[]> menuList){

        return formatMenuData(menuList, 2);
    }

    /**
	 * Sets the offset value for pagination.
	 * @param offset
	 * @param linkClicked it could be next, previous, last, first
	 * @param productListSize the size of the entie list.
	 * @return the offset value.
	 */
	public static Integer setOffset4Pagination(Integer offset, String linkClicked, Integer productListSize,
                                                    Integer pageLength){

		Integer offsetVar = 0;
		if(offset != null){
			if(linkClicked != null && linkClicked.equals("next")){
				offsetVar = offset + pageLength;

			}else if(linkClicked != null && linkClicked.equals("previous")){
				offsetVar = offset - pageLength;

			}else if(linkClicked != null && linkClicked.equals("first")){
				offsetVar = 0;

			}else if(linkClicked != null && linkClicked.equals("last")){
				offsetVar = productListSize != null ? ((productListSize - 1)/pageLength) * pageLength: 0;
			}
		}

		return offsetVar;
	}

    /**
     * Get the contact details from db.
     * @param hibernateSession
     * @param companyId
     * @return
     * @throws java.lang.Exception
     */
    public static ArrayList<GeneralForm> fetchContactDetails(Session hibernateSession, Integer companyId) throws Exception{

        List<Object[]> contactDetailsList = SSCorpDAO.fetchContactDetails(hibernateSession, companyId);
        
        ArrayList<GeneralForm> populatedList = null;

        if(contactDetailsList != null && contactDetailsList.size() > 0){
           populatedList = populateContactDetailsList(contactDetailsList);
        }

        return populatedList;
    }

    /**
     * Get the mobile numbers of owners from db.
     * @param hibernateSession
     * @param companyId
     * @return
     * @throws java.lang.Exception
     */
    public static ArrayList<GeneralForm> fetchMobileNumbers(Session hibernateSession, Integer companyId) throws Exception{

        List<Object[]> mobileNumberList = SSCorpDAO.fetchMobileNumbers(hibernateSession, companyId);

        ArrayList<GeneralForm> populatedList = null;
        
        if(mobileNumberList != null && mobileNumberList.size() > 0){
            populatedList = populateMobileNumbers(mobileNumberList);
        }

        return populatedList;
    }

    /**
     * Populates the contact details from the list returned by DAO in the form bean.
     * @param contactDetailsList contains the contact details data to be shown on the home page
     * @return the list containig the data.
     */
    private static ArrayList<GeneralForm> populateContactDetailsList(List<Object[]> contactDetailsList) throws Exception{

        ArrayList<GeneralForm> populatedList = new ArrayList<GeneralForm>();
        GeneralForm generalForm = null;

        for(int count = 0; count < contactDetailsList.size(); count++){
            generalForm = new GeneralForm();

            generalForm.setStreetAddress(((Object[])contactDetailsList.get(count))[0] != null ? ((Object[])contactDetailsList.get(count))[0].toString() : "");
            generalForm.setCity(((Object[])contactDetailsList.get(count))[1] != null ? ((Object[])contactDetailsList.get(count))[1].toString() : "");
            generalForm.setProvince(((Object[])contactDetailsList.get(count))[2] != null ? ((Object[])contactDetailsList.get(count))[2].toString() : "");
            generalForm.setCountry(((Object[])contactDetailsList.get(count))[3] != null ? ((Object[])contactDetailsList.get(count))[3].toString() : "");
            generalForm.setZipCode(((Object[])contactDetailsList.get(count))[4] != null ? ((Object[])contactDetailsList.get(count))[4].toString() : "");

            populatedList.add(generalForm);
        }

        return populatedList;
    }

    /**
     * populates the list of mobile numbers to be displayed on the home page
     * @param mobileNumberList
     * @return
     */
    private static ArrayList<GeneralForm> populateMobileNumbers(List<Object[]> mobileNumberList) throws Exception{
        ArrayList<GeneralForm> populatedList = new ArrayList<GeneralForm>();
        GeneralForm generalForm = null;

        for(int count = 0; count < mobileNumberList.size(); count++){
            generalForm = new GeneralForm();

            generalForm.setMobileOwnerName(((Object[])mobileNumberList.get(count))[0] != null ? ((Object[])mobileNumberList.get(count))[0].toString() : "-");
            StringBuffer mobileNumber = new StringBuffer();
            mobileNumber.append(((Object[])mobileNumberList.get(count))[1] != null ? ((Object[])mobileNumberList.get(count))[1].toString() : "");
            mobileNumber.append(((Object[])mobileNumberList.get(count))[2] != null ? ((Object[])mobileNumberList.get(count))[2].toString() : "");
            mobileNumber.append(((Object[])mobileNumberList.get(count))[3] != null ? ((Object[])mobileNumberList.get(count))[3].toString() : "");
            generalForm.setMobileNumber(mobileNumber.toString());

            populatedList.add(generalForm);
        }

        return populatedList;
    }
}

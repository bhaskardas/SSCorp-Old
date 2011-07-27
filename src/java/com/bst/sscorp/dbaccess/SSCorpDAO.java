/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bst.sscorp.dbaccess;

import com.bst.sscorp.entities.achievments.SscorpAchievmentsM;
import com.bst.sscorp.entities.address.SscorpAddressM;
import com.bst.sscorp.entities.companyprofile.SscorpCompanyProfileM;
import com.bst.sscorp.entities.customerdetails.SscorpCustomerDetailsT;
import com.bst.sscorp.entities.menu.SscorpMenuM;
import com.bst.sscorp.entities.mobilenumbers.SscorpPhoneNumbersM;
import com.bst.sscorp.entities.products.SscorpProductDetailT;
import com.bst.sscorp.entities.products.SscorpProductsCategoryM;
import com.bst.sscorp.entities.projects.SscorpProjectCategoryM;
import com.bst.sscorp.entities.projects.SscorpProjectsM;
import com.bst.sscorp.entities.querydetails.SscorpQueryDetailsT;
import com.bst.sscorp.util.PropertiesUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;

/**
 *
 * @author bhaskar
 */
public class SSCorpDAO {

    /**
     * Inserts the query information entered by the user through the front end.
     * @param sscorpQueryDetailsT POJO containing the query information
     * @param hibernateSession hibernate session variable
     * @throws java.lang.Exception
     */
    public static void insertQueryDetails(SscorpQueryDetailsT sscorpQueryDetailsT, Session hibernateSession) throws Exception{
            hibernateSession.save(sscorpQueryDetailsT);
    }

     /**
      * Gets the product details to be displayed on the web page.
      * @param hibernateSession hibernate session variable
      * @param companyId fetches the product details based on the company Id
      * @param productCatId category Id of the products which are to be fetched
      * @return list containing the product details.
      * @throws java.lang.Exception
      */
    public static List<Object[]> fetchProductDetails(Session hibernateSession, Integer companyId,
                                                        Integer productCatId) throws Exception{
        List<Object[]> productDetailsList = null;

        if(hibernateSession != null){
            Criteria criteria = hibernateSession.createCriteria(SscorpProductDetailT.class)
                                                .createAlias("sscorpProductsCategoryM", "pc")
                                                .createAlias("sscorpProductsM", "p")
                                                .createAlias("sscorpProductDescM", "pd")
                                                .createAlias("sscorpProductMaterialM", "pm")
                                                .createAlias("sscorpProductSizeM", "ps");

            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.property("pc.productCatId"));
            projectionList.add(Projections.property("pc.productCatName"));
            projectionList.add(Projections.property("p.productName"));
            projectionList.add(Projections.property("pd.prodDescName"));
            projectionList.add(Projections.property("pm.prodMaterialName"));
            projectionList.add(Projections.property("ps.prodSize"));
            projectionList.add(Projections.property("prodPhotoAttachName"));
            projectionList.add(Projections.property("prodDetId"));

            criteria.setProjection(projectionList);
            
            criteria.add(Expression.eq("pc.productCatId", productCatId));
            criteria.add(Expression.eq("pc.sscorpCompanyProfileM.companyId", companyId));
            criteria.addOrder(Order.asc("p.productName"));

            productDetailsList = criteria.list();
        }

        return productDetailsList;
    }

    /**
     * Insert customer detailscoming from the query details page. 
     * @param sscorpCustomerDetailsT POJO containing the customer details.
     * @param hibernateSession hibernate session variable
     * @throws java.lang.Exception
     */
    public static void insertCustomerDetails(SscorpCustomerDetailsT sscorpCustomerDetailsT,
                                    Session hibernateSession) throws Exception{

        hibernateSession.save(sscorpCustomerDetailsT);
    }

    /**
     * Gets the menu to be loaded and displayed on the web page from database.
     * @param hibernateSession hibernate session variable
     * @param companyId query fetches the menu based on the specific company. 
     * @return list of objects containing the menu information.
     * @throws java.lang.Exception
     */
    public static List<Object[]> fetchMenuInfo(Session hibernateSession, Integer companyId) throws Exception{
        
        List<Object[]> menuListObj = null;

        if(hibernateSession != null){
            Criteria criteria = hibernateSession.createCriteria(SscorpMenuM.class);

            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.property("menuName"));
            projectionList.add(Projections.property("menuUrl"));
            projectionList.add(Projections.property("additionalMenuUrl"));

            criteria.setProjection(projectionList);

            criteria.add(Expression.eq("sscorpCompanyProfileM.companyId", companyId));
            criteria.addOrder(Order.asc("menuPosition"));

            menuListObj = criteria.list();
        }

        return menuListObj;
    }

    /**
     * Gets the infranstructure information to be displayed on the profile page.
     * @param hibernateSession hibernate session variable
     * @param companyId fetch is based on the company Id
     * @return string having the infrastructure information.
     */
    public static String fetchInfrastructureInfo(Session hibernateSession, Integer companyId){
        String infrastructure = null;
        
        if(hibernateSession != null){
            Criteria criteria = hibernateSession.createCriteria(SscorpCompanyProfileM.class);

            ProjectionList projectionList = Projections.projectionList();

            projectionList.add(Projections.property("infrastructure"));

            criteria.setProjection(projectionList);
            criteria.add(Expression.eq("companyId", companyId));
            infrastructure = (String)criteria.uniqueResult();
        }

        return infrastructure;
    }

    /**
     * Gets the description heading for achievments to be displayed on the profile page.
     * @param hibernateSession hibernate session variable
     * @param companyId fetch is based on the company Id.
     * @return string having the achievements description. 
     */
    public static String fetchAchievementDesc(Session hibernateSession, Integer companyId){
        String achievementsDesc = null;

        if(hibernateSession != null){
            Criteria criteria = hibernateSession.createCriteria(SscorpCompanyProfileM.class);

            ProjectionList projectionList = Projections.projectionList();

            projectionList.add(Projections.property("achievmentsDesc"));

            criteria.setProjection(projectionList);
            criteria.add(Expression.eq("companyId", companyId));

            achievementsDesc = (String)criteria.uniqueResult();
        }

        return achievementsDesc;
    }

    /**
     * Gets the entire achievements information for achievements from database.
     * @param hibernateSession hibernate session variable
     * @param companyId fetch is based on the company Id.
     * @return list of objects containing the achievements information in each row,
     */
    public static List<Object[]> fetchAchievements(Session hibernateSession, Integer companyId){

        List<Object[]> achievementsList = null;
        if(hibernateSession != null){
            Criteria criteria = hibernateSession.createCriteria(SscorpAchievmentsM.class)
                                                .createAlias("sscorpCompanyProfileM", "cp");

            ProjectionList projectionList = Projections.projectionList();

            projectionList.add(Projections.property("achievementName"));
            projectionList.add(Projections.property("achievmentDesc"));

            criteria.setProjection(projectionList);
            criteria.add(Expression.eq("sscorpCompanyProfileM.companyId", companyId));

            achievementsList = criteria.list();
        }

        return achievementsList;
    }

    /**
     * Gets the about us inforamtion from database.
     * @param hibernateSession hibernate session variable
     * @return string having the about us information.
     */
    public static String fetchAboutUsInfo(Session hibernateSession, Integer companyId){
        String aboutUs = null;
        if(hibernateSession != null){
            Criteria aboutUsCriteria = hibernateSession.createCriteria(SscorpCompanyProfileM.class);

            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.property("aboutUs"));

            aboutUsCriteria.setProjection(projectionList);
            aboutUsCriteria.add(Expression.eq("companyId", companyId));
            aboutUs = (String)aboutUsCriteria.uniqueResult();
        }

        return aboutUs;
    }

    /**
     * Gets teh contact details to be displayed on the home and contactUs page.
     * @param hibernateSession hibernate session variable
     * @param companyId fetch is based on the based on companyId
     * @return list of objects containing all the contact information.
     */
    public static List<Object[]> fetchContactDetails(Session hibernateSession, Integer companyId){
        List<Object[]> contactDetailsList = null;

        if(hibernateSession != null){
            Criteria criteria = hibernateSession.createCriteria(SscorpAddressM.class)
                                                    .createAlias("sscorpCompanyProfileM", "cp");

            ProjectionList projectionList = Projections.projectionList();

            projectionList.add(Projections.property("this.address"));
            projectionList.add(Projections.property("this.city"));
            projectionList.add(Projections.property("this.province"));
            projectionList.add(Projections.property("this.country"));
            projectionList.add(Projections.property("this.zipcode"));

            criteria.setProjection(projectionList);
            criteria.add(Expression.eq("sscorpCompanyProfileM.companyId", companyId));
            criteria.add(Expression.eq("addressId", 1));
            
            contactDetailsList = criteria.list();
        }

        return contactDetailsList;
    }

    /**
     * Gets the mobile numbers of all the owners.
     * @param hibernateSession hibernate session variable
     * @param companyId fetch is based on the company Id
     * @return list of objects containing the mobile numbers.
     */
    public static List<Object[]> fetchMobileNumbers(Session hibernateSession, Integer companyId){

        List<Object[]> phoneNumberList = null;

        if(hibernateSession != null){
            Criteria criteria = hibernateSession.createCriteria(SscorpPhoneNumbersM.class)
                                                .createAlias("sscorpCompanyProfileM", "cp");

            ProjectionList projectionList = Projections.projectionList();
            
            projectionList.add(Projections.property("this.phoneOwner"));
            projectionList.add(Projections.property("this.countryCode"));
            projectionList.add(Projections.property("this.stdCode"));
            projectionList.add(Projections.property("this.phoneNumber"));

            criteria.setProjection(projectionList);
            criteria.add(Expression.eq("sscorpCompanyProfileM.companyId", companyId));

            phoneNumberList = criteria.list();
        }

        return phoneNumberList;
    }

    /**
     * Gets the  entire company profile.
     * @param hibernateSession hibernate session variable
     * @return POJO containing the entire company information.
     * @throws java.lang.Exception
     */
    public static SscorpCompanyProfileM fetchCompanyProfileInfo(Session hibernateSession) throws Exception{
        Criteria criteria = hibernateSession.createCriteria(SscorpCompanyProfileM.class);

        criteria.add(Expression.eq("companyId", Integer.parseInt(PropertiesUtil.readProperty("ApplicationResource", "sscorp.companyId"))));
        criteria.add(Expression.eq("companyName", PropertiesUtil.readProperty("ApplicationResource", "sscorp.companyName")));

        return (SscorpCompanyProfileM)criteria.uniqueResult();
    }

    /**
     * Gets the entire projects list of the company
     * @param hibernateSession hibernate session variable
     * @param companyId fetch is based on the company Id
     * @return list of objects containing the project information.
     */
    public static List<Object[]> fetchProjectInfo(Session hibernateSession, Integer projectCategoryId, Integer companyId)
                                               throws Exception{

        List<Object[]> projectInfoList = null;

        if(hibernateSession != null){
            Criteria criteria = hibernateSession.createCriteria(SscorpProjectsM.class)
                                                .createAlias("sscorpProjectCategoryM", "pc")
                                                .createAlias("sscorpAddressM", "a");

            ProjectionList projectionList = Projections.projectionList();

            projectionList.add(Projections.property("pc.projectCatId"));
            projectionList.add(Projections.property("this.projectName"));
            projectionList.add(Projections.property("a.city"));
            projectionList.add(Projections.property("a.province"));
//            projectionList.add(Projections.property("pc.projectCategory"));

            criteria.setProjection(projectionList);
            if(projectCategoryId != null)
                criteria.add(Expression.eq("pc.projectCatId", projectCategoryId));

            criteria.add(Expression.eq("pc.sscorpCompanyProfileM.companyId", companyId));
            criteria.addOrder(Order.asc("pc.projectCategory"));

            projectInfoList = criteria.list();
        }

        System.out.println(projectInfoList.size());
        return projectInfoList;
    }

    /**
     * 
     * @param hibernateSession
     * @param companyId
     * @return
     * @throws java.lang.Exception
     */
    public static List<SscorpProjectCategoryM> fetchProjectCategory(Session hibernateSession,
                                                                Integer companyId) throws Exception{

        List<SscorpProjectCategoryM> projCategoryList = null;
        if(hibernateSession != null){
            Criteria criteria = hibernateSession.createCriteria(SscorpProjectCategoryM.class);

            criteria.add(Expression.eq("sscorpCompanyProfileM.companyId", companyId));
            criteria.addOrder(Order.asc("projectCategory"));
            projCategoryList = criteria.list();
        }

        return projCategoryList;
    }

    /**
     * Function to fetch the list of product categories.
     * @param hibernateSession
     * @param companyId
     * @return
     */
    public static List<SscorpProductsCategoryM> fetchProductCategory(Session hibernateSession, Integer companyId){

        List<SscorpProductsCategoryM> productCategoryList = null;

        if(hibernateSession != null){
            Criteria criteria = hibernateSession.createCriteria(SscorpProductsCategoryM.class);

            criteria.add(Expression.eq("sscorpCompanyProfileM.companyId", companyId));
            criteria.addOrder(Order.asc("productCatName"));
            productCategoryList = criteria.list();
        }

        return productCategoryList;
    }

    /**
     * 
     * @param hibernateSession
     * @param productDetailId
     * @return
     */
    public static List<Object[]> fetchMoreProdImages(Session hibernateSession, Integer productDetailId){

        List<Object[]> prodImagesList = null;

        if(hibernateSession != null){
            Criteria criteria = hibernateSession.createCriteria(SscorpProductDetailT.class)
                                                .createAlias("sscorpProductsM", "p");

            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.property("prodPhotoAttachName"));
            projectionList.add(Projections.property("p.productName"));

            criteria.setProjection(projectionList);

            criteria.add(Expression.eq("prodDetId", productDetailId));

            prodImagesList = criteria.list();
        }

        return prodImagesList;
    }
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bst.sscorp.actionclasses.products;

import com.bst.sscorp.dbaccess.SSCorpDAO;
import com.bst.sscorp.entities.companyprofile.SscorpCompanyProfileM;
import com.bst.sscorp.entities.products.SscorpProductsCategoryM;
import com.bst.sscorp.formclasses.products.ProductDetailsForm;
import com.bst.sscorp.util.HibernateSessionFactory;
import java.io.File;
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
 *
 * @author bhaskar
 */
public class FetchProdCategoriesAction extends Action{

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Session hibernateSession = null;

        try{
            hibernateSession = HibernateSessionFactory.getSessionFactory().openSession();

            Integer companyId = ((SscorpCompanyProfileM)request.getSession().getAttribute("companyProfile")).getCompanyId();

            if(request.getSession().getAttribute("productCategoryList") == null){
                List<SscorpProductsCategoryM> prodCatList = SSCorpDAO.fetchProductCategory(hibernateSession, companyId);

                if(prodCatList != null && prodCatList.size() > 0){
                    List<ProductDetailsForm> prodCategoryList = populateProdCatList(prodCatList, request);
                    if(prodCategoryList != null && prodCategoryList.size() > 0)
                        request.setAttribute("productCategoryList", prodCategoryList);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            hibernateSession.close();
        }

        return mapping.findForward("showProductCategory");
    }

    private List<ProductDetailsForm> populateProdCatList(List<SscorpProductsCategoryM> prodCatList,
                                                            HttpServletRequest request){

        List<ProductDetailsForm> prodCategoryList = null;

        prodCategoryList = new ArrayList<ProductDetailsForm>();
        ProductDetailsForm productDetailsForm = null;

        for(SscorpProductsCategoryM productsCategoryM : prodCatList){
            productDetailsForm = new ProductDetailsForm();
            productDetailsForm.setProductCategoryId(productsCategoryM.getProductCatId().toString());
            productDetailsForm.setProductCategoryName(productsCategoryM.getProductCatName());
            productDetailsForm.setPhotoAttachName(request.getContextPath() + File.separator + "images" + File.separator + "sscorp" + File.separator + "product_category" + File.separator + productsCategoryM.getProdCatPhotoAttachName());

            prodCategoryList.add(productDetailsForm);
        }

        return prodCategoryList;
    }
}

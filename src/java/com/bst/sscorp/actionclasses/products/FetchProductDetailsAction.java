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
import com.bst.sscorp.util.PropertiesUtil;
import com.bst.sscorp.util.SSCorpUtil;
import java.io.File;
import java.util.ArrayList;
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
 * @date 6 Dec 2009
 */
public class FetchProductDetailsAction extends Action{

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
                                        throws Exception {

        Session hibernateSession = null;
        try{
            ProductDetailsForm productDetailsForm = (ProductDetailsForm)form;
            
            hibernateSession = HibernateSessionFactory.getSessionFactory().openSession();

            Integer companyId = ((SscorpCompanyProfileM)request.getSession().getAttribute("companyProfile")).getCompanyId();

            if(request.getSession().getAttribute("productCategoryMap") == null){
                List<SscorpProductsCategoryM> productCategoryList = SSCorpDAO.fetchProductCategory(hibernateSession, companyId);

                if(productCategoryList != null && productCategoryList.size() > 0){
                    LinkedHashMap<Integer, String> productCategoryMap = populateComboBoxData(productCategoryList);
                    if(productCategoryMap != null && productCategoryMap.size() > 0)
                        request.getSession().setAttribute("productCategoryMap", productCategoryMap);
                }
            }

            if(request.getSession().getAttribute("productDetails") == null ||
//                    request.getParameter("linkClicked") == null){
                    productDetailsForm.getLinkClicked().equals("")){

                List<Object[]> productDetailsList = null;

                if(productDetailsForm.getSelectedProductCat() != null && !productDetailsForm.getSelectedProductCat().equals("")){
                    productDetailsList = SSCorpDAO.fetchProductDetails(hibernateSession, companyId, 
                                                Integer.parseInt(productDetailsForm.getSelectedProductCat()));

                }else if(productDetailsForm.getSelectedProductCat().equals("")){
                    productDetailsList = SSCorpDAO.fetchProductDetails(hibernateSession, companyId, null);
                }
                
                if(productDetailsList != null && productDetailsList.size() > 0){

                    if(request.getSession().getAttribute("productDetails") != null)
                        request.getSession().removeAttribute("productDetails");

                    if(request.getSession().getAttribute("productListSize") != null)
                        request.getSession().removeAttribute("productListSize");

                    ArrayList<ProductDetailsForm> productDetails = setProductDetails(request, productDetailsList);
                    if(productDetails != null && productDetails.size() > 0){
                        request.getSession().setAttribute("productDetails", productDetails);
                        request.getSession().setAttribute("productListSize", productDetails.size());
                    }
                }
            }

            Integer productListSize = request.getSession().getAttribute("productListSize") != null ?
                                        Integer.parseInt(request.getSession().getAttribute("productListSize").toString()) : null;

//            Integer offset = request.getParameter("offset") != null ? Integer.parseInt(request.getParameter("offset").toString()) : null;

            Integer offset = !productDetailsForm.getOffset().equals("") ? Integer.parseInt(productDetailsForm.getOffset()) : null;

            Integer pageLength = Integer.parseInt(PropertiesUtil.readProperty("ApplicationResource", "productDetails.paging.pageLength"));

            offset = SSCorpUtil.setOffset4Pagination(offset, productDetailsForm.getLinkClicked(),
                                                                            productListSize, pageLength);

            request.setAttribute("productPageLength", pageLength);
			request.setAttribute("offset", offset);

        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
            hibernateSession.close();
        }

        return mapping.findForward("showProductDetails");
    }

    /**
     * saves the product details in an arraylist containing objects of type ProductDetailsForm.
     * @param request
     * @param productDetailsList contains the list of products with their details.
     * @return
     */
    private ArrayList<ProductDetailsForm> setProductDetails(HttpServletRequest request, 
                                                                List<Object[]> productDetailsList){

        ArrayList<ProductDetailsForm> productList = new ArrayList<ProductDetailsForm>();

        ProductDetailsForm productDetailsForm = null;
        String images = null;

        for(int count = 0; count < productDetailsList.size(); count++){
            productDetailsForm = new ProductDetailsForm();

            productDetailsForm.setProductCategoryId(((Object[])productDetailsList.get(count))[0] != null ? ((Object[])productDetailsList.get(count))[0].toString() : "-");
            productDetailsForm.setProductCategoryName(((Object[])productDetailsList.get(count))[1] != null ? ((Object[])productDetailsList.get(count))[1].toString() : "-");
            productDetailsForm.setProductName(((Object[])productDetailsList.get(count))[2] != null ? ((Object[])productDetailsList.get(count))[2].toString() : "-");
            productDetailsForm.setProductFinish(((Object[])productDetailsList.get(count))[3] != null ? ((Object[])productDetailsList.get(count))[3].toString() : "-");
            productDetailsForm.setProductMaterial(((Object[])productDetailsList.get(count))[4] != null ? ((Object[])productDetailsList.get(count))[4].toString() : "-");
            productDetailsForm.setProductSize(((Object[])productDetailsList.get(count))[5] != null ? ((Object[])productDetailsList.get(count))[5].toString() : "-");

            if(((Object[])productDetailsList.get(count))[6] != null){
                images = ((Object[])productDetailsList.get(count))[6].toString();

                if(images.split(",").length > 1)
                    productDetailsForm.setIsMoreImagesPresent(true);
                
                productDetailsForm.setPhotoAttachName(request.getContextPath() + File.separator + "images" + File.separator + "sscorp" + File.separator + "products" + File.separator + images.split(",")[0]);
            }

            productDetailsForm.setProductDetailId(((Object[])productDetailsList.get(count))[7] != null ? ((Object[])productDetailsList.get(count))[7].toString() : "-");

            productList.add(productDetailsForm);
        }
        
        return productList;
    }

    /**
     * function to populate the product categories in a hashmap.
     * @param productNamesList
     * @return
     */
    private LinkedHashMap<Integer, String> populateComboBoxData(List<SscorpProductsCategoryM> productCategoryList){

        LinkedHashMap<Integer, String> productCategoryMap = new LinkedHashMap<Integer, String>();
        SscorpProductsCategoryM productsCategoryM = null;
        for(int count = 0;  count < productCategoryList.size(); count++){
            productsCategoryM = productCategoryList.get(count);
            productCategoryMap.put(productsCategoryM.getProductCatId(), productsCategoryM.getProductCatName());
        }

        return productCategoryMap;
    }
}
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bst.sscorp.actionclasses.products;

import com.bst.sscorp.dbaccess.SSCorpDAO;
import com.bst.sscorp.formclasses.products.ProductDetailsForm;
import com.bst.sscorp.util.HibernateSessionFactory;
import com.bst.sscorp.util.PropertiesUtil;
import com.bst.sscorp.util.SSCorpUtil;
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
 * @dated 20 March 2010
 */
public class FetchMoreProdImages extends Action{

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        String productDetailId = request.getParameter("prodDetailId");

        Session hibernateSession = null;

        try{
            ProductDetailsForm productDetailsForm = (ProductDetailsForm)form;

            hibernateSession = HibernateSessionFactory.getSessionFactory().openSession();

            if(productDetailId != null || productDetailsForm.getLinkClicked().equals("")){
                List<Object[]> prodImagesList = SSCorpDAO.fetchMoreProdImages(hibernateSession, Integer.parseInt(productDetailId));

                if(prodImagesList != null && prodImagesList.size() > 0){
                    List<String> imagesList = setImages(prodImagesList, request);

                    if(imagesList != null && imagesList.size() > 0){
                        if(request.getSession().getAttribute("productImageList") != null)
                            request.getSession().removeAttribute("productImageList");

                        if(request.getSession().getAttribute("productImageListSize") != null)
                            request.getSession().removeAttribute("productImageListSize");

                        request.getSession().setAttribute("productImageList", imagesList);
                        request.getSession().setAttribute("productImageListSize", imagesList.size());
                    }
                }
            }

            Integer prodImageListSize = request.getSession().getAttribute("productImageListSize") != null ?
                                        Integer.parseInt(request.getSession().getAttribute("productImageListSize").toString()) : null;

            Integer offset = !productDetailsForm.getOffset().equals("") ? Integer.parseInt(productDetailsForm.getOffset()) : null;

            Integer pageLength = Integer.parseInt(PropertiesUtil.readProperty("ApplicationResource", "showMoreImages.paging.pageLength"));

            offset = SSCorpUtil.setOffset4Pagination(offset, productDetailsForm.getLinkClicked(),
                                                                            prodImageListSize, pageLength);

            request.setAttribute("imagesPageLength", pageLength);
			request.setAttribute("offset", offset);

        }catch(Exception e){
            e.printStackTrace();
        }finally{
            hibernateSession.close();
        }

        return mapping.findForward("showImages");
    }

    /**
     * Sets the addtional images to be displayed in a popup window for a particular product.
     * @param prodImagesList
     * @param request
     * @return
     */
    private List<String> setImages(List<Object[]> prodImagesList, HttpServletRequest request){

        List<String> imagesList = new ArrayList<String>();
        String[] imagesArr = null;
        String productName = ((Object[])prodImagesList.get(0))[1].toString();

        if(request.getSession().getAttribute("productName") != null)
            request.getSession().removeAttribute("productName");
        
        request.getSession().setAttribute("productName", productName);

        for(Object[] obj : prodImagesList){
            imagesArr = obj[0].toString().trim().split(",");

            for(int count = 1; count < imagesArr.length; count++){
                imagesList.add(request.getContextPath() + File.separator + "images" + File.separator + "sscorp" +
                                File.separator + "products" + File.separator + imagesArr[count].trim());
            }
        }
        
        return imagesList;
    }
}
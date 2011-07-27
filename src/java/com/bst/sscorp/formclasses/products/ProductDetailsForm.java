/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bst.sscorp.formclasses.products;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author bhaskar
 * @date 6Dec 2009
 */
public class ProductDetailsForm extends ActionForm{

    private String productName;
    private String productSize;
    private String productMaterial;
    private String productFinish;
    private String photoAttachName;
    private Boolean isMoreImagesPresent;
    private String productCategoryName;
    private String productCategoryId;
    private String productDetailId;

    /**
     * Variable for the filter section
     */
    private String selectedProductCat;

    /**
     * Variables for paging in the product detail page and the popup image page.
     */

    private String offset;
    private String linkClicked;
    
    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request) {

        this.setPhotoAttachName("");
        this.setProductFinish("");
        this.setProductMaterial("");
        this.setProductName("");
        this.setProductSize("");
        this.setProductCategoryId("");
        this.setProductCategoryName("");
        this.setIsMoreImagesPresent((Boolean) false);
        this.setProductDetailId("");

        this.setSelectedProductCat("");

        this.setLinkClicked("");
        this.setOffset("");
    }

    /**
     * @return the productName
     */
    public String getProductName() {
        return productName;
    }

    /**
     * @param productName the productName to set
     */
    public void setProductName(String productName) {
        this.productName = productName;
    }

    /**
     * @return the productSize
     */
    public String getProductSize() {
        return productSize;
    }

    /**
     * @param productSize the productSize to set
     */
    public void setProductSize(String productSize) {
        this.productSize = productSize;
    }

    /**
     * @return the productMaterial
     */
    public String getProductMaterial() {
        return productMaterial;
    }

    /**
     * @param productMaterial the productMaterial to set
     */
    public void setProductMaterial(String productMaterial) {
        this.productMaterial = productMaterial;
    }

    /**
     * @return the productFinish
     */
    public String getProductFinish() {
        return productFinish;
    }

    /**
     * @param productFinish the productFinish to set
     */
    public void setProductFinish(String productFinish) {
        this.productFinish = productFinish;
    }

    /**
     * @return the photoAttachName
     */
    public String getPhotoAttachName() {
        return photoAttachName;
    }

    /**
     * @param photoAttachName the photoAttachName to set
     */
    public void setPhotoAttachName(String photoAttachName) {
        this.photoAttachName = photoAttachName;
    }

    /**
     * @return the selectedProduct
     */
    public String getSelectedProductCat() {
        return selectedProductCat;
    }

    /**
     * @param selectedProduct the selectedProduct to set
     */
    public void setSelectedProductCat(String selectedProductCat) {
        this.selectedProductCat = selectedProductCat;
    }

    /**
     * @return the productCategoryName
     */
    public String getProductCategoryName() {
        return productCategoryName;
    }

    /**
     * @param productCategoryName the productCategoryName to set
     */
    public void setProductCategoryName(String productCategoryName) {
        this.productCategoryName = productCategoryName;
    }

    /**
     * @return the productCategoryId
     */
    public String getProductCategoryId() {
        return productCategoryId;
    }

    /**
     * @param productCategoryId the productCategoryId to set
     */
    public void setProductCategoryId(String productCategoryId) {
        this.productCategoryId = productCategoryId;
    }

    /**
     * @return the isMoreImagesPresent
     */
    public Boolean getIsMoreImagesPresent() {
        return isMoreImagesPresent;
    }

    /**
     * @param isMoreImagesPresent the isMoreImagesPresent to set
     */
    public void setIsMoreImagesPresent(Boolean isMoreImagesPresent) {
        this.isMoreImagesPresent = isMoreImagesPresent;
    }

    /**
     * @return the productDetailId
     */
    public String getProductDetailId() {
        return productDetailId;
    }

    /**
     * @param productDetailId the productDetailId to set
     */
    public void setProductDetailId(String productDetailId) {
        this.productDetailId = productDetailId;
    }

    /**
     * @return the offset
     */
    public String getOffset() {
        return offset;
    }

    /**
     * @param offset the offset to set
     */
    public void setOffset(String offset) {
        this.offset = offset;
    }

    /**
     * @return the linkClikced
     */
    public String getLinkClicked() {
        return linkClicked;
    }

    /**
     * @param linkClikced the linkClikced to set
     */
    public void setLinkClicked(String linkClicked) {
        this.linkClicked = linkClicked;
    }
}

package com.bst.sscorp.entities.products;
// Generated 24 Mar, 2010 10:09:36 PM by Hibernate Tools 3.2.1.GA



/**
 * SscorpProductDetailT generated by hbm2java
 */
public class SscorpProductDetailT  implements java.io.Serializable {


     private Integer prodDetId;
     private SscorpProductsM sscorpProductsM;
     private SscorpProductSizeM sscorpProductSizeM;
     private SscorpProductsCategoryM sscorpProductsCategoryM;
     private SscorpProductMaterialM sscorpProductMaterialM;
     private SscorpProductDescM sscorpProductDescM;
     private String prodPhotoAttachName;

    public SscorpProductDetailT() {
    }

    public SscorpProductDetailT(SscorpProductsM sscorpProductsM, SscorpProductSizeM sscorpProductSizeM, SscorpProductsCategoryM sscorpProductsCategoryM, SscorpProductMaterialM sscorpProductMaterialM, SscorpProductDescM sscorpProductDescM, String prodPhotoAttachName) {
       this.sscorpProductsM = sscorpProductsM;
       this.sscorpProductSizeM = sscorpProductSizeM;
       this.sscorpProductsCategoryM = sscorpProductsCategoryM;
       this.sscorpProductMaterialM = sscorpProductMaterialM;
       this.sscorpProductDescM = sscorpProductDescM;
       this.prodPhotoAttachName = prodPhotoAttachName;
    }
   
    public Integer getProdDetId() {
        return this.prodDetId;
    }
    
    public void setProdDetId(Integer prodDetId) {
        this.prodDetId = prodDetId;
    }
    public SscorpProductsM getSscorpProductsM() {
        return this.sscorpProductsM;
    }
    
    public void setSscorpProductsM(SscorpProductsM sscorpProductsM) {
        this.sscorpProductsM = sscorpProductsM;
    }
    public SscorpProductSizeM getSscorpProductSizeM() {
        return this.sscorpProductSizeM;
    }
    
    public void setSscorpProductSizeM(SscorpProductSizeM sscorpProductSizeM) {
        this.sscorpProductSizeM = sscorpProductSizeM;
    }
    public SscorpProductsCategoryM getSscorpProductsCategoryM() {
        return this.sscorpProductsCategoryM;
    }
    
    public void setSscorpProductsCategoryM(SscorpProductsCategoryM sscorpProductsCategoryM) {
        this.sscorpProductsCategoryM = sscorpProductsCategoryM;
    }
    public SscorpProductMaterialM getSscorpProductMaterialM() {
        return this.sscorpProductMaterialM;
    }
    
    public void setSscorpProductMaterialM(SscorpProductMaterialM sscorpProductMaterialM) {
        this.sscorpProductMaterialM = sscorpProductMaterialM;
    }
    public SscorpProductDescM getSscorpProductDescM() {
        return this.sscorpProductDescM;
    }
    
    public void setSscorpProductDescM(SscorpProductDescM sscorpProductDescM) {
        this.sscorpProductDescM = sscorpProductDescM;
    }
    public String getProdPhotoAttachName() {
        return this.prodPhotoAttachName;
    }
    
    public void setProdPhotoAttachName(String prodPhotoAttachName) {
        this.prodPhotoAttachName = prodPhotoAttachName;
    }




}



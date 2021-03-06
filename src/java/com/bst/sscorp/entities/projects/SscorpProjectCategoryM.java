package com.bst.sscorp.entities.projects;
// Generated 6 Apr, 2010 7:32:14 AM by Hibernate Tools 3.2.1.GA


import com.bst.sscorp.entities.companyprofile.SscorpCompanyProfileM;
import java.util.HashSet;
import java.util.Set;

/**
 * SscorpProjectCategoryM generated by hbm2java
 */
public class SscorpProjectCategoryM  implements java.io.Serializable {


     private Integer projectCatId;
     private SscorpCompanyProfileM sscorpCompanyProfileM;
     private String projectCategory;
     private Set<SscorpProjectsM> sscorpProjectsMs = new HashSet<SscorpProjectsM>(0);

    public SscorpProjectCategoryM() {
    }

	
    public SscorpProjectCategoryM(String projectCategory) {
        this.projectCategory = projectCategory;
    }
    public SscorpProjectCategoryM(SscorpCompanyProfileM sscorpCompanyProfileM, String projectCategory, Set<SscorpProjectsM> sscorpProjectsMs) {
       this.sscorpCompanyProfileM = sscorpCompanyProfileM;
       this.projectCategory = projectCategory;
       this.sscorpProjectsMs = sscorpProjectsMs;
    }
   
    public Integer getProjectCatId() {
        return this.projectCatId;
    }
    
    public void setProjectCatId(Integer projectCatId) {
        this.projectCatId = projectCatId;
    }
    public SscorpCompanyProfileM getSscorpCompanyProfileM() {
        return this.sscorpCompanyProfileM;
    }
    
    public void setSscorpCompanyProfileM(SscorpCompanyProfileM sscorpCompanyProfileM) {
        this.sscorpCompanyProfileM = sscorpCompanyProfileM;
    }
    public String getProjectCategory() {
        return this.projectCategory;
    }
    
    public void setProjectCategory(String projectCategory) {
        this.projectCategory = projectCategory;
    }
    public Set<SscorpProjectsM> getSscorpProjectsMs() {
        return this.sscorpProjectsMs;
    }
    
    public void setSscorpProjectsMs(Set<SscorpProjectsM> sscorpProjectsMs) {
        this.sscorpProjectsMs = sscorpProjectsMs;
    }




}



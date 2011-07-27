/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bst.sscorp.formclasses.general;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author bhaskar
 * @created on 25 Dec 2009
 */
public class GeneralForm extends ActionForm{

    /**
     * Mobile Number information to be displayed on the home page and the contactUs page.
     */
    private String mobileOwnerName;
    private String mobileNumber;

    /**
     * Variables to display the address information of the company in the
     * home page and the contact us page.
     */
    private String streetAddress;
    private String city;
    private String province;
    private String country;
    private String zipCode;

    /**
     * Variables for the filter section in the projectList.jsp page.
     */
    private String selectedProjCategory;

    /**
     * Variables for paging links in project page.
     */
    private String linkClicked;
    private String offset;

    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request) {

        this.setMobileNumber("");

        this.streetAddress = "";
        this.city = "";
        this.province = "";
        this.country = "";
        this.zipCode = "";

        this.setSelectedProjCategory("");
        this.setLinkClicked("");
        this.setOffset("");
    }

    /**
     * @return the streetAddress
     */
    public String getStreetAddress() {
        return streetAddress;
    }

    /**
     * @param streetAddress the streetAddress to set
     */
    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return the province
     */
    public String getProvince() {
        return province;
    }

    /**
     * @param province the province to set
     */
    public void setProvince(String province) {
        this.province = province;
    }

    /**
     * @return the country
     */
    public String getCountry() {
        return country;
    }

    /**
     * @param country the country to set
     */
    public void setCountry(String country) {
        this.country = country;
    }

    /**
     * @return the zipCode
     */
    public String getZipCode() {
        return zipCode;
    }

    /**
     * @param zipCode the zipCode to set
     */
    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    /**
     * @return the mobileOwnerName
     */
    public String getMobileOwnerName() {
        return mobileOwnerName;
    }

    /**
     * @param mobileOwnerName the mobileOwnerName to set
     */
    public void setMobileOwnerName(String mobileOwnerName) {
        this.mobileOwnerName = mobileOwnerName;
    }

    /**
     * @return the mobileNumber
     */
    public String getMobileNumber() {
        return mobileNumber;
    }

    /**
     * @param mobileNumber the mobileNumber to set
     */
    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    /**
     * @return the selectedProjCategory
     */
    public String getSelectedProjCategory() {
        return selectedProjCategory;
    }

    /**
     * @param selectedProjCategory the selectedProjCategory to set
     */
    public void setSelectedProjCategory(String selectedProjCategory) {
        this.selectedProjCategory = selectedProjCategory;
    }

    /**
     * @return the linkClicked
     */
    public String getLinkClicked() {
        return linkClicked;
    }

    /**
     * @param linkClicked the linkClicked to set
     */
    public void setLinkClicked(String linkClicked) {
        this.linkClicked = linkClicked;
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
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bst.sscorp.formclasses.achievements;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author bhaskar
 */
public class AchievementsForm extends ActionForm{

    private String achievementName;
    private String achievementDesc;


    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        this.setAchievementDesc("");
        this.setAchievementName("");
    }

    /**
     * @return the achievementName
     */
    public String getAchievementName() {
        return achievementName;
    }

    /**
     * @param achievementName the achievementName to set
     */
    public void setAchievementName(String achievementName) {
        this.achievementName = achievementName;
    }

    /**
     * @return the achievementDesc
     */
    public String getAchievementDesc() {
        return achievementDesc;
    }

    /**
     * @param achievementDesc the achievementDesc to set
     */
    public void setAchievementDesc(String achievementDesc) {
        this.achievementDesc = achievementDesc;
    }
}

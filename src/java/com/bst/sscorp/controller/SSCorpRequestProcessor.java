/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bst.sscorp.controller;

import com.bst.sscorp.entities.companyprofile.SscorpCompanyProfileM;
import com.bst.sscorp.util.SSCorpUtil;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.tiles.TilesRequestProcessor;

/**
 *
 * @author bhaskar
 * @created on Dec 15, 2009 
 */
public class SSCorpRequestProcessor extends TilesRequestProcessor{

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response)
                                                             throws IOException, ServletException {
        
        //Check if the company profile data is set in session or not. If not, then set it in session.
        if(request.getSession().getAttribute("companyProfile") == null){
            try{
                SscorpCompanyProfileM sscorpCompanyProfileM = SSCorpUtil.fetchCompanyProfileInfo();
                if(sscorpCompanyProfileM != null)
                    request.getSession().setAttribute("companyProfile", sscorpCompanyProfileM);
            }catch(Exception e){
                e.printStackTrace();
            }
        }

        if(request.getSession().getAttribute("menuMap") == null){
            try{
                Integer companyId = ((SscorpCompanyProfileM)request.getSession().getAttribute("companyProfile")).getCompanyId();

                ArrayList<LinkedHashMap<String, String>> menuDataList = SSCorpUtil.fetchTabMenu(companyId);

                LinkedHashMap<String, String> menuMap = menuDataList.get(0);
                LinkedHashMap<String, String> addtionalMenuDataMap = menuDataList.get(1);

                if(menuMap != null && menuMap.size() > 0){
                    request.getSession().setAttribute("menuMap", menuMap);
                }

                if(addtionalMenuDataMap != null && addtionalMenuDataMap.size() > 0){
                    request.getSession().setAttribute("addtionalMenuDataMap", addtionalMenuDataMap);
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        }

        if(request.getSession().getAttribute("menuMap") != null &&
                ((LinkedHashMap<String, String>)request.getSession().getAttribute("menuMap")).size() > 0){

            LinkedHashMap<String, String> menuMap = (LinkedHashMap<String, String>)request.getSession().getAttribute("menuMap");

            if(request.getSession().getAttribute("currentMenuName") != null)
                    request.getSession().removeAttribute("currentMenuName");

            
            if(request.getParameter("currentMenuName") != null){
                if(menuMap.containsKey(request.getParameter("currentMenuName"))){
                    request.getSession().setAttribute("currentMenuName", request.getParameter("currentMenuName"));
                }
            }else{
                String key = null;
                String menuUrl = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")).trim();
                if(menuMap.containsValue(menuUrl)){
                    Iterator<String> menuMapItr = menuMap.keySet().iterator();
                    System.out.println("menuUrl check returned true" + menuUrl);
                    while(menuMapItr.hasNext()){
                        key = menuMapItr.next();

                        if(menuMap.get(key).equals(menuUrl)){
                            request.getSession().setAttribute("currentMenuName", key);
                            break;
                        }
                    }
                }else{ //If some additional url is clicked
                    if(request.getSession().getAttribute("addtionalMenuDataMap") != null){
                        LinkedHashMap<String, String> addtionalMenuDataMap = (LinkedHashMap<String, String>)request.getSession().getAttribute("addtionalMenuDataMap");
                        Iterator<String> menuItr = addtionalMenuDataMap.keySet().iterator();

                        while(menuItr.hasNext()){
                            key = menuItr.next();

                            if(Arrays.asList(addtionalMenuDataMap.get(key).trim().split(",")).contains(menuUrl)){
                                request.getSession().setAttribute("currentMenuName", key);
                                break;
                            }
                        }
                    }
                }
            }
        }

        super.process(request, response);
    }
}
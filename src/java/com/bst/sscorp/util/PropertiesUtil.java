/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bst.sscorp.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author bhaskar
 * @created on 5th Jan'10
 */
public class PropertiesUtil {

    /**
     * The map variable to store all the properties file.
     */
    private static HashMap<String, Properties> propFileMap = new HashMap<String, Properties>();
    
    /**
     * 
     * @param fileName
     * @param key
     * @return
     */
    public static String readProperty(String fileName, String key){

        String value = null;

        try{
            if(propFileMap == null){
                loadAllPropertiesFile();
            }

            if(propFileMap != null && propFileMap.size() > 0){
                if(propFileMap.get(fileName) != null && propFileMap.containsKey(fileName)){
                    value = propFileMap.get(fileName).getProperty(key);
                }
            }else{
                value = loadPropertiesFile(fileName).getProperty(key);
            }
            
        }catch(IOException ioe){
            ioe.printStackTrace();
        }catch(Exception e){
            e.printStackTrace();
        }

        return value;
    }

    /**
     * 
     * @param fileName
     * @param key
     * @return
     */
    public static HashMap<String, String> readPropertyFile(String fileName){
        HashMap<String, String> propMap = null;

        try {
            if(propFileMap == null){
                loadAllPropertiesFile();
            }

            if(propFileMap != null && propFileMap.size() > 0){
                if(propFileMap.get(fileName) != null && propFileMap.containsKey(fileName)){
                    propMap = populatePropertiesMap(propFileMap.get(fileName));
                }
            }else{
                propMap = populatePropertiesMap(loadPropertiesFile(fileName));
            }
            
        }catch (IOException ex) {
            ex.printStackTrace();
            Logger.getLogger(PropertiesUtil.class.getName()).log(Level.SEVERE, null, ex);
        }catch (Exception ex) {
            ex.printStackTrace();
            Logger.getLogger(PropertiesUtil.class.getName()).log(Level.SEVERE, null, ex);
        }

        return propMap;
    }

    /**
     * 
     * @param fileName
     * @throws java.io.IOException
     */
    private static Properties loadPropertiesFile(String fileName)throws IOException{
        String filePath = "com/bst/sscorp/config/";
        String fileExtension = ".properties";
        Properties prop = null;

        InputStream inputStream = PropertiesUtil.class.getClassLoader()
                                                .getResourceAsStream(filePath + fileName + fileExtension);
        if(inputStream != null){
            prop = new Properties();
            prop.load(inputStream);
        }

        return prop;
    }

    /**
     * 
     * @throws java.io.IOException
     */
    private static void loadAllPropertiesFile()throws IOException{
        Properties masterProp = null;

        InputStream inputStream = PropertiesUtil.class.getClassLoader()
                                                .getResourceAsStream("com/bst/sscorp/config/master-config.properties");
        if(inputStream != null){
            masterProp = new Properties();
            masterProp.load(inputStream);
        }

        if(masterProp != null){
            String key = null;
            Iterator<Object> propItr = masterProp.keySet().iterator();
            while(propItr.hasNext()){
                key = propItr.next().toString();
                propFileMap.put(key, loadPropertiesFile(key));
            }
        }
    }

    /**
     * 
     * @param prop
     * @return
     * @throws java.lang.Exception
     */
    private static HashMap<String, String> populatePropertiesMap(Properties prop) throws Exception{

        HashMap<String, String> configMap = null;

        if(prop != null){
            String key = null;
            configMap = new HashMap<String, String>();
            
            Iterator<Object> propItr = prop.keySet().iterator();
            while(propItr.hasNext()){
                key = propItr.next().toString();
                configMap.put(key, prop.getProperty(key));
            }
        }

        return configMap;
    }
}

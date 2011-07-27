/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 */
function submitQuery(){
    if(validate() == false){
        return false;
    }
    document.saveQueryDetails.submit();
}

/**
 *
 */
function resetQueryDetailsFields(){

    document.saveQueryDetails.gender.value = "";
    document.saveQueryDetails.firstName.value = "";
    document.saveQueryDetails.lastName.value = "";
    document.saveQueryDetails.companyName.value = "";
    document.saveQueryDetails.companyWebsite.value = "";
    document.saveQueryDetails.emailId.value = "";
    document.saveQueryDetails.phoneNo.value = "";
    document.saveQueryDetails.mobileNo.value = "";
    document.saveQueryDetails.subject.value = "";
    document.saveQueryDetails.queryString.value = "";
    document.saveQueryDetails.hearAboutUs.value = "";
}

/**
 *
 */
function validate(){
    if(document.saveQueryDetails.gender.value == "" || document.saveQueryDetails.firstName.value == "" ||
        document.saveQueryDetails.emailId.value == "" || document.saveQueryDetails.queryString.value == ""){

        alert("Fields marked * cannot be left blank");
        return false;
    }

    if(!echeck(document.saveQueryDetails.emailId.value)){
        document.saveQueryDetails.emailId.value = "";
        document.saveQueryDetails.emailId.focus();
        return false;
    }

//    if(chkNumeric(document.saveQueryDetails.phoneNo.value) == false){
//        return false;
//    }
//
//    if(chkNumeric(document.saveQueryDetails.mobileNo.value) == false){
//        return false;
//    }
}
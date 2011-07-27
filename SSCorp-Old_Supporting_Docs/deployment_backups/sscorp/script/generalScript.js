/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * function to submit the request for the list of projects based project category input.
 */
function getProjects4Category(obj) {

    document.generalForm.selectedProjCategory.value = obj.value;
    document.generalForm.submit();
}

/**
 * function to display the next projects page.
 */
function showNextProjectPage(offset, linkClicked) {
    document.nextProjectPage.offset.value = offset;
    document.nextProjectPage.linkClicked.value = linkClicked;
    document.nextProjectPage.submit();
}

/**
 * Function to check the proper email format
 */
function echeck(str) {

		var at="@"
		var dot="."
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
		if (str.indexOf(at)==-1){
		   alert("Invalid e-mail Id format");
		   return false;
		}

		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   alert("Invalid e-mail Id format");
		   return false;
		}

		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    alert("Invalid e-mail Id format");
		    return false;
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		    alert("Invalid e-mail Id format");
		    return false;
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    alert("Invalid e-mail Id format");
		    return false;
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    alert("Invalid e-mail Id format");
		    return false;
		 }

		 if (str.indexOf(" ")!=-1){
		    alert("Invalid e-mail Id format");
		    return false;
		 }

 		 return true;
	}

//function chkNumeric(strString){
//    var strValidChars = "0123456789.-";
//    var strChar;
//    var blnResult = true;
//
//    if (strString.length == 0) return false;
//    //  test strString consists of valid characters listed above
//    for (i = 0; i < strString.length && blnResult == true; i++){
//        strChar = strString.charAt(i);
//        if (strValidChars.indexOf(strChar) == -1){
//            blnResult = false;
//        }
//    }
//
//    return blnResult;
//}

/**
 * function to determine the menu to be displayed
 */
function showMenu(contextPath, menuUrl, currentMenuName) {
    document.menuForm.action = contextPath + menuUrl;
    document.menuForm.currentMenuName.value = currentMenuName;
    document.menuForm.submit();
}
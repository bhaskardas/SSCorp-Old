/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *Function to submit the request for product details based on product category.
 */
function getProduct(obj, pageValue){
    if(pageValue == 'productCategoryPage'){
        document.productDetailsForm.selectedProductCat.value = obj.id;
    }else if(pageValue == 'productDetailsPage'){
        document.productDetailsForm.selectedProductCat.value = obj.value;
    }

    document.productDetailsForm.submit();
}

/**
 * displays additional images related a particular product in a popup window..
 */
function showMoreImages(obj, contextPath) {
    popupImagesWindow = window.open(contextPath + "/showMoreImages.do?prodDetailId=" + obj.id, "window",
                "width=400, height=300, status=1, scrollbars=1");

    popupImagesWindow.moveTo(500, 400);
    return false;
}

/**
 *
 */
function getImage(offset, linkClicked) {
    document.imagesForm.linkClicked.value = linkClicked;
    document.imagesForm.offset.value = offset;
    document.imagesForm.submit();
}

/**
 * Displays the next or previous page. The parameters required to display the next or previous
 * page are the linkclicked andthe offset.
 */
function showNextPage(offset, linkClicked) {
    document.nextProductPage.linkClicked.value= linkClicked;
    document.nextProductPage.offset.value= offset;
    document.nextProductPage.submit();
}

/**
 * Go back to previous page (product categories page)
 */
function goBack(contextPath, url) {

    document.backForm.action = contextPath + url;
    document.backForm.submit();
}

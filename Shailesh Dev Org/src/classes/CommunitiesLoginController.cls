/**
 * An apex page controller that exposes the site login functionality
 */
global with sharing class CommunitiesLoginController {

    global CommunitiesLoginController () {}
    
    // Code we will invoke on page load.
   public PageReference forwardToCustomAuthPage() {
String startUrl = System.currentPageReference().getParameters().get('startURL');
return new PageReference(Site.getPrefix() + '/SiteLogin?startURL=' +
EncodingUtil.urlEncode(startURL, 'UTF-8'));
}
}
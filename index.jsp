<!--
Copyright (C) 2013 Google Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->
<%@ page import="com.google.api.client.auth.oauth2.Credential" %>
<%@ page import="com.google.api.services.mirror.model.Contact" %>
<%@ page import="com.google.glassware.MirrorClient" %>
<%@ page import="com.google.glassware.WebUtil" %>
<%@ page
    import="java.util.List" %>
<%@ page import="com.google.api.services.mirror.model.TimelineItem" %>
<%@ page import="com.google.api.services.mirror.model.Subscription" %>
<%@ page import="com.google.api.services.mirror.model.Attachment" %>
<%@ page import="com.google.glassware.MainServlet" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<%
  String userId = com.google.glassware.AuthUtil.getUserId(request);
  String appBaseUrl = WebUtil.buildUrl(request, "/");

  Credential credential = com.google.glassware.AuthUtil.getCredential(userId);

  Contact contact = MirrorClient.getContact(credential, MainServlet.CONTACT_NAME);

  List<TimelineItem> timelineItems = MirrorClient.listItems(credential, 3L).getItems();


  List<Subscription> subscriptions = MirrorClient.listSubscriptions(credential).getItems();
  boolean timelineSubscriptionExists = false;
  boolean locationSubscriptionExists = false;


  if (subscriptions != null) {
    for (Subscription subscription : subscriptions) {
      if (subscription.getId().equals("timeline")) {
        timelineSubscriptionExists = true;
      }
      if (subscription.getId().equals("locations")) {
        locationSubscriptionExists = true;
      }
    }
  }

%>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FuelTrak</title>
  <link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet"
        media="screen">

  <link rel="stylesheet" href="/static/bootstrap/css/reset.css" type="text/css" media="screen">
  <link rel="stylesheet" href="/static/bootstrap/css/style.css" type="text/css" media="screen">
  <link rel="stylesheet" href="/static/bootstrap/css/grid.css" type="text/css" media="screen"> 
  <script src="/static/bootstrap/js/jquery-1.6.2.min.js" type="text/javascript"></script>     
  
  <!--[if lt IE 7]>
        <div style=' clear: both; text-align:center; position: relative;'>
            <a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0"  alt="" /></a>
        </div>
  <![endif]-->
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/html5.js"></script>
        <link rel="stylesheet" href="/static/bootstrap/css/ie.css" type="text/css" media="screen">
  <![endif]-->

</head>
<body id="page4">
  <!--==============================header=================================-->
    <header>
      <div class="row-1">
          <div class="main">
              <div class="container_12">
                  <div class="grid_12">
                      <nav>
                            <ul class="menu">
                                <li><a class="active" href="index.jsp">Home</a></li>
                                <li><a href="services.html">Goals</a></li>
                                <li><a href="catalogue.html">Progress</a></li>
                                <li><a href="pricing.html">Saved Menu</a></li>
                                <li><a href="contacts.html">About</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="row-2">
          <div class="main">
              <div class="container_12">
                  <div class="grid_9">
                      <h1>
                            <a class="logo" href="index.html">FuelTrak</a>
                        </h1>
                    </div>
                    <div class="grid_3">
                      <form id="search-form" method="post" enctype="multipart/form-data">
                            <fieldset>  
                                <div class="search-field">
                                    <input name="search" type="text" />
                                    <a class="search-button" href="#" onClick="document.getElementById('search-form').submit()"><span>search</span></a> 
                                </div>            
                            </fieldset>
                        </form>
                     </div>
                     <div class="clear"></div>
                </div>
            </div>
        </div>      
    </header><div class="ic">FuelTrak powered by Google Glass</div>
    
<!-- content -->
<section id="content">
        <div class="bg-top">
          <div class="bg-top-2">
                <div class="bg">
                    <div class="bg-top-shadow">
                        <div class="main">
                            <div class="box p3">
                                <div class="padding">
                                    <div class="container_12">
                                        <div class="wrapper">
                                            <div class="grid_12">
                                                <div class="wrapper">
                                                    <article class="grid_4 alpha">
                                                        <div class="indent">
                                                            <h3 class="prev-indent-bot2">Get Started</h3>
                                                            <ul class="list-2">
                                                                <li><a href="#">Daily Goals/Progress</a></li>
                                                                <li><a href="#">Weekly Goals/Progress</a></li>
                                                                <li><a href="#">Saved Menu's</a></li>
                                                                <li><a href="#">Meal Search</a></li>
                                                                <li class="last-item"><a href="#">About</a></li>
                                                            </ul>
                                                        </div>
                                                    </article>
                                                    <article class="grid_8 omega">
                                                        <div class="indent-right">
                                                            <h3 class="p2">Home</h3>
                                                            <div class="wrapper prev-indent-bot2">
                                                                <figure class="img-indent2 frame2"><img class="button-icon" src="<%= appBaseUrl +
                                                                      "static/images/FuelTrak.png" %>"></figure>
                                                                <div class="extra-wrap">
                                                                    <h6 class="prev-indent-bot">FuelTrak is a google glassware which provides 
                                                                      war fighters with detailed meal information. </h6>
                                                                    FuelTrak also keeps track of daily progress and a sophisticated goal information
                                                                    platform that can be accessed real-time through google glass
                                                                </div>
                                                            </div>
                                                            <p>To begin using the app, war fighters enter their height, weight, age and activity level</p>
                                                            <p>War fighters scan the meal they wish to consume through google glass</p>
                                                            <p>FuelTrak uses OCR(Optical Character Recognition) technology to determine the food packet
                                                            </p> 
                                                            <p>FuelTrak queries the nutrional data sets to return meal information including micro/macro
                                                              nutrients levels on google glass</p>
                                                            <p>War fighters can record meal consumption through google glass</p>
                                                            <p>FuelTrak automatically calculates daily progress consumption and charts relevant goal
                                                              information</p>
                                                            <a class="button" href="#">Read More</a>
                                                        </div>
                                                    </article>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container_12">
                              <div class="wrapper">
                                  <article class="grid_4">
                                      <h3 class="color-1 p2">About</h3>
                                        <span class="text-1">FuelTrak was designed, architected and implemented at the Department of Defense
                                          hackathon by the smart developers from Vision Retailing Inc</span>
                                    </article>
                                    <article class="grid_4">
                                      <h3 class="color-1 p2">Technologies Used</h3>
                                        <span class="text-1">Google Glass mirror API, Java</span>
                                    </article>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
    </section>

    
  <!--==============================footer=================================-->
    <footer>
        <div class="main">
          <div class="container_12">
              <div class="wrapper">
                  <div class="grid_4">
                      <div>Vision Retailing &copy; 2013 <a class="link color-3" href="#">Privacy Policy</a></div>
                        <div><a rel="nofollow" target="_blank" href="http://www.shoeline.com/">FuelTrak</a> by Vision Retailing</div>
                        <!-- {%FOOTER_LINK} -->
                    </div>
                    <div class="grid_4">
                      <span class="phone-numb"><span>@fueltrak</span>
                    </div>
                    <div class="grid_4">
                      <ul class="list-services">
                          <li><a href="#"></a></li>
                            <li><a class="item-2" href="#"></a></li>
                            <li><a class="item-3" href="#"></a></li>
                            <li><a class="item-4" href="#"></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>

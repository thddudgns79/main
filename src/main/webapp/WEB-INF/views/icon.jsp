<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/board"/>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="orange">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
      <div class="logo">
        <a href="http://www.creative-tim.com" class="simple-text logo-mini">
          CT
        </a>
        <a href="http://www.creative-tim.com" class="simple-text logo-normal">
          Creative Tim
        </a>
      </div>
      <div class="sidebar-wrapper" id="sidebar-wrapper">
        <ul class="nav">
          <li>
            <a href="./dashboard.html">
              <i class="now-ui-icons design_app"></i>
              <p>Dashboard</p>
            </a>
          </li>
          <li class="active ">
            <a href="./icons.html">
              <i class="now-ui-icons education_atom"></i>
              <p>Icons</p>
            </a>
          </li>
          <li>
            <a href="./map.html">
              <i class="now-ui-icons location_map-big"></i>
              <p>Maps</p>
            </a>
          </li>
          <li>
            <a href="./notifications.html">
              <i class="now-ui-icons ui-1_bell-53"></i>
              <p>Notifications</p>
            </a>
          </li>
          <li>
            <a href="./user.html">
              <i class="now-ui-icons users_single-02"></i>
              <p>User Profile</p>
            </a>
          </li>
          <li>
            <a href="./tables.html">
              <i class="now-ui-icons design_bullet-list-67"></i>
              <p>Table List</p>
            </a>
          </li>
          <li>
            <a href="./typography.html">
              <i class="now-ui-icons text_caps-small"></i>
              <p>Typography</p>
            </a>
          </li>
          <li class="active-pro">
            <a href="./upgrade.html">
              <i class="now-ui-icons arrows-1_cloud-download-93"></i>
              <p>Upgrade to PRO</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel" id="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent  bg-primary  navbar-absolute">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="#pablo">Icons</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
            <form>
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <i class="now-ui-icons ui-1_zoom-bold"></i>
                  </div>
                </div>
              </div>
            </form>
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="#pablo">
                  <i class="now-ui-icons media-2_sound-wave"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Stats</span>
                  </p>
                </a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="now-ui-icons location_world"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Some Actions</span>
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#pablo">
                  <i class="now-ui-icons users_single-02"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Account</span>
                  </p>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="panel-header panel-header-sm">
      </div>
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h5 class="title">100 Awesome Nucleo Icons</h5>
                <p class="category">Handcrafted by our friends from <a href="https://nucleoapp.com/?ref=1712">NucleoApp</a></p>
              </div>
              <div class="card-body all-icons">
                <div class="row">
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons arrows-1_cloud-download-93"></i>
                      <p>arrows-1_cloud-download-93</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons arrows-1_cloud-upload-94"></i>
                      <p>arrows-1_cloud-upload-94</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons arrows-1_minimal-down"></i>
                      <p>arrows-1_minimal-down</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons arrows-1_minimal-left"></i>
                      <p>arrows-1_minimal-left</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons arrows-1_minimal-right"></i>
                      <p>arrows-1_minimal-right</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons arrows-1_minimal-up"></i>
                      <p>arrows-1_minimal-up</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons arrows-1_refresh-69"></i>
                      <p>arrows-1_refresh-69</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons arrows-1_share-66 "></i>
                      <p>arrows-1_share-66</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons business_badge"></i>
                      <p>business_badge</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons business_bank"></i>
                      <p>business_bank</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons business_briefcase-24" ></i>
                      <p>business_briefcase-24</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons business_bulb-63"></i>
                      <p>business_bulb-63</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons business_chart-bar-32"></i>
                      <p>business_chart-bar-32</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons business_chart-pie-36"></i>
                      <p>business_chart-pie-36</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons business_globe"></i>
                      <p>business_globe</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons business_money-coins"></i>
                      <p>business_money-coins</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons clothes_tie-bow"></i>
                      <p>clothes_tie-bow</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons design_app"></i>
                      <p>design_app</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons design_bullet-list-67"></i>
                      <p>design_bullet-list-67</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons design_image"></i>
                      <p>design_image</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons design_palette"></i>
                      <p>design_palette</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons design_scissors"></i>
                      <p>design_scissors</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons design_vector"></i>
                      <p>design_vector</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons design-2_html5"></i>
                      <p>design-2_html5</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons design-2_ruler-pencil"></i>
                      <p>design-2_ruler-pencil</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons emoticons_satisfied"></i>
                      <p>emoticons_satisfied</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons files_box"></i>
                      <p>files_box</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons files_paper"></i>
                      <p>files_paper</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons files_single-copy-04"></i>
                      <p>files_single-copy-04</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons health_ambulance"></i>
                      <p>health_ambulance</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons loader_gear"></i>
                      <p>loader_gear</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons loader_refresh"></i>
                      <p>loader_refresh</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons location_bookmark"></i>
                      <p>location_bookmark</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons location_compass-05"></i>
                      <p>location_compass-05</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons location_map-big"></i>
                      <p>location_map-big</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons location_pin"></i>
                      <p>location_pin</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons location_world"></i>
                      <p>location_world</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons media-1_album"></i>
                      <p>media-1_album</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons media-1_button-pause"></i>
                      <p>media-1_button-pause</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons media-1_button-play"></i>
                      <p>media-1_button-play</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons media-1_button-power"></i>
                      <p>media-1_button-power</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons media-1_camera-compact"></i>
                      <p>media-1_camera-compact</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons media-2_note-03"></i>
                      <p>media-2_note-03</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons media-2_sound-wave"></i>
                      <p>media-2_sound-wave</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons objects_diamond"></i>
                      <p>objects_diamond</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons objects_globe"></i>
                      <p>objects_globe</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons objects_key-25"></i>
                      <p>objects_key-25</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons objects_planet"></i>
                      <p>objects_planet</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons objects_spaceship"></i>
                      <p>objects_spaceship</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons objects_support-17"></i>
                      <p>objects_support-17</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons objects_umbrella-13"></i>
                      <p>objects_umbrella-13</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons education_agenda-bookmark"></i>
                      <p>education_agenda-bookmark</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons education_atom"></i>
                      <p>education_atom</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons education_glasses"></i>
                      <p>education_glasses</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons education_hat"></i>
                      <p>education_hat</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons education_paper"></i>
                      <p>education_paper</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons shopping_bag-16"></i>
                      <p>shopping_bag-16</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons shopping_basket"></i>
                      <p>shopping_basket</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons shopping_box"></i>
                      <p>shopping_box</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons shopping_cart-simple"></i>
                      <p>shopping_cart-simple</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons shopping_credit-card"></i>
                      <p>shopping_credit-card</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons shopping_delivery-fast"></i>
                      <p>shopping_delivery-fast</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons shopping_shop"></i>
                      <p>shopping_shop</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons shopping_tag-content"></i>
                      <p>shopping_tag-content</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons sport_trophy"></i>
                      <p>sport_trophy</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons sport_user-run"></i>
                      <p>sport_user-run</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons tech_controller-modern"></i>
                      <p>tech_controller-modern</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons tech_headphones"></i>
                      <p>tech_headphones</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons tech_laptop"></i>
                      <p>tech_laptop</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons tech_mobile"></i>
                      <p>tech_mobile</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons tech_tablet"></i>
                      <p>tech_tablet</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons tech_tv"></i>
                      <p>tech_tv</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons tech_watch-time"></i>
                      <p>tech_watch-time</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons text_align-center"></i>
                      <p>text_align-center</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons text_align-left"></i>
                      <p>text_align-left</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons text_bold"></i>
                      <p>text_bold</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons text_caps-small"></i>
                      <p>text_caps-small</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons gestures_tap-01"></i>
                      <p>gestures_tap-01</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons transportation_air-baloon"></i>
                      <p>transportation_air-baloon</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons transportation_bus-front-12"></i>
                      <p>transportation_bus-front-12</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons travel_info"></i>
                      <p>travel_info</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons travel_istanbul"></i>
                      <p>travel_istanbul</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons ui-1_bell-53"></i>
                      <p>ui-1_bell-53</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons ui-1_check"></i>
                      <p>ui-1_check</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons ui-1_calendar-60"></i>
                      <p>ui-1_calendar-60</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons ui-1_lock-circle-open"></i>
                      <p>ui-1_lock-circle-open</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons ui-1_send"></i>
                      <p>ui-1_send</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons ui-1_settings-gear-63"></i>
                      <p>ui-1_settings-gear-63</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons ui-1_simple-add"></i>
                      <p>ui-1_simple-add</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons ui-1_simple-delete"></i>
                      <p>ui-1_simple-delete</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons ui-1_simple-remove"></i>
                      <p>ui-1_simple-remove</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons ui-1_zoom-bold"></i>
                      <p>ui-1_zoom-bold</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons ui-2_chat-round"></i>
                      <p>ui-2_chat-round</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons ui-2_favourite-28"></i>
                      <p>ui-2_favourite-28</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons ui-2_like"></i>
                      <p>ui-2_like</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons ui-2_settings-90"></i>
                      <p>ui-2_settings-90</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons ui-2_time-alarm"></i>
                      <p>ui-2_time-alarm</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons ui-1_email-85"></i>
                      <p>ui-1_email-85</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons users_circle-08"></i>
                      <p>users_circle-08</p>
                    </div>
                  </div>
                  <div class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
                    <div class="font-icon-detail">
                      <i class="now-ui-icons users_single-02"></i>
                      <p>users_single-02</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <footer class="footer">
        <div class=" container-fluid ">
          <nav>
            <ul>
              <li>
                <a href="https://www.creative-tim.com">
                  Creative Tim
                </a>
              </li>
              <li>
                <a href="http://presentation.creative-tim.com">
                  About Us
                </a>
              </li>
              <li>
                <a href="http://blog.creative-tim.com">
                  Blog
                </a>
              </li>
            </ul>
          </nav>
          <div class="copyright" id="copyright">
            &copy; <script>
              document.getElementById('copyright').appendChild(document.createTextNode(new Date().getFullYear()))
            </script>, Designed by <a href="https://www.invisionapp.com" target="_blank">Invision</a>. Coded by <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a>.
          </div>
        </div>
      </footer>
    </div>
  </div>
  <jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/> 
</body>
</html>
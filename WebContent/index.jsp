<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="images/favicon.png" type="">

  <title> Dessert Kingdom </title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- nice select  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />

<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">


</head>

<body>

<!--   <div class="hero_area"> -->
<!--     <div class="bg-box"> -->
<!--       <img src="images/hero-bg.jpg" alt=""> -->
<!--     </div> -->
    <!-- header section strats -->
   <%@ include file="WEB-INF/views/common/header.jsp" %>
   

    <!-- end header section -->
    
    
    
    <!-- slider section -->
    <section class="slider_section" style="background: url('https://cdn.pixabay.com/photo/2016/03/27/21/59/bread-1284438_960_720.jpg') no-repeat 50%; background-size: cover;">
      <div id="customCarousel1" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="container ">
              <div class="row">
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                    <h1>
                    	마카롱 마스터 과정
                    </h1>
                    <p>
                    	습도, 오븐 등에 영향을 많이 받는 마카롱의 특성을 이해하고 프렌치, 이탈리안, 스위스 머랭법에 따른 퀄리티 높은 꼬끄를 만들어 각 재료의 조화로운 맛을 끌어낼 수 있는 필링제조와 개성있는 플레이팅을 시연합니다.
                    </p>

                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item ">
            <div class="container ">
              <div class="row">
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                    <h1>
                    	케이크 마스터 과정
                    </h1>
                    <p>
                    	케이크 시트의 식감 차이를 위한 반죽스타일을 이해하고, 크림 제조 및 다양한 케이크 제조, 데코레이션 스킬까지 마스터합니다. 데코레이션을 위한 초콜릿, 파우더, 과일 등의 사용법과 아이싱, 파이핑 스킬, 케이크 디자인 기술까지 퀄리티 높은 제조를 위한 모든 과정을 교육합니다. 
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <div class="container ">
              <div class="row">
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                    <h1>
                    	타르트 마스터 과정
                    </h1>
                    <p>
                    	타르트의 기본이 되는 타르트지의 식감별 반죽의 차이를 이해하고 만드는 방식에 따른 타르트지 반죽을 진행합니다. 타르트의 반죽법과 다양한 필링등을 제조하고, 각 나라(지역)별 대표적인 타르트를 실습합니다. 
                    
                    </p>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="container">
          <ol class="carousel-indicators">
            <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
            <li data-target="#customCarousel1" data-slide-to="1"></li>
            <li data-target="#customCarousel1" data-slide-to="2"></li>
          </ol>
        </div>
      </div>

    </section>
    <!-- end slider section -->


  <!-- info section -->

   <section class="info_section layout_padding-bottom">
       <div class="info_container">
         <div class="container ">
         <h1>INFORMATION</h1>
           <div class="row">
             <div class="col-md-6  ">
               <div class="box boxsize1">
                 <div class="calendarBox">
               <div class="my-calendar clearfix">
                
                   <div class="calendar-box">
                     <div class="ctr-box clearfix">
                       <button type="button" title="prev" class="btn-cal prev">
                       </button>
                       <span class="cal-month">May</span>
                       <span class="cal-year">2022</span>
                       <button type="button" title="next" class="btn-cal next">
                       </button>
                     </div>
                     <table class="cal-table">
                       <thead>
                         <tr>
                           <th>S</th>
                           <th>M</th>
                           <th>T</th>
                           <th>W</th>
                           <th>T</th>
                           <th>F</th>
                           <th>S</th>
                         </tr>
                       </thead>
                       <tbody class="cal-body"><tr><td class="day" data-date="1" data-fdate="2022.05.01">1</td><td class="day" data-date="2" data-fdate="2022.05.02">2</td><td class="day" data-date="3" data-fdate="2022.05.03">3</td><td class="day" data-date="4" data-fdate="2022.05.04">4</td><td class="day" data-date="5" data-fdate="2022.05.05">5</td><td class="day" data-date="6" data-fdate="2022.05.06">6</td><td class="day" data-date="7" data-fdate="2022.05.07">7</td></tr><tr><td class="day today" data-date="8" data-fdate="2022.05.08">8</td><td class="day" data-date="9" data-fdate="2022.05.09">9</td><td class="day" data-date="10" data-fdate="2022.05.10">10</td><td class="day" data-date="11" data-fdate="2022.05.11">11</td><td class="day" data-date="12" data-fdate="2022.05.12">12</td><td class="day" data-date="13" data-fdate="2022.05.13">13</td><td class="day" data-date="14" data-fdate="2022.05.14">14</td></tr><tr><td class="day" data-date="15" data-fdate="2022.05.15">15</td><td class="day" data-date="16" data-fdate="2022.05.16">16</td><td class="day" data-date="17" data-fdate="2022.05.17">17</td><td class="day" data-date="18" data-fdate="2022.05.18">18</td><td class="day" data-date="19" data-fdate="2022.05.19">19</td><td class="day" data-date="20" data-fdate="2022.05.20">20</td><td class="day" data-date="21" data-fdate="2022.05.21">21</td></tr><tr><td class="day" data-date="22" data-fdate="2022.05.22">22</td><td class="day" data-date="23" data-fdate="2022.05.23">23</td><td class="day" data-date="24" data-fdate="2022.05.24">24</td><td class="day" data-date="25" data-fdate="2022.05.25">25</td><td class="day" data-date="26" data-fdate="2022.05.26">26</td><td class="day" data-date="27" data-fdate="2022.05.27">27</td><td class="day" data-date="28" data-fdate="2022.05.28">28</td></tr><tr><td class="day" data-date="29" data-fdate="2022.05.29">29</td><td class="day" data-date="30" data-fdate="2022.05.30">30</td><td class="day" data-date="31" data-fdate="2022.05.31">31</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody>
                     </table>
                   </div>
                   <div class="clicked-date">
                     <div class="cal-day">Sunday</div>
                     <div class="cal-date">8</div>
                     <div class="event-what"></div>
                   </div>
              </div>
            </div>
               </div>
             </div>
             <div class="col-md-6  ">
               <div class="box  boxsize2" style="height: 580px;">
                    <div class="noticeBox">
                  <h2>NOTICE</h2>
                  <table>
                     <tbody>
                     <tr>
                        <td>학원 연휴 안내</td>
                        <td>2022.05.05</td>
                     </tr>
                     <tr>
                        <td>바리스타 과정 오픈!</td>
                        <td>2022.04.25</td>
                     </tr>
                     <tr>
                        <td>4월 봄맞이 EVENT</td>
                        <td>2022.04.01</td>
                     </tr>
                     <tr>
                        <td>강의 안내</td>
                        <td>2022.03.15</td>
                     </tr>
                     <tr>
                        <td>신학기 이벤트 안내</td>
                        <td>2022.03.02</td>
                     </tr>
                     <tr>
                        <td>신규 클래스 안내</td>
                        <td>2022.02.10</td>
                     </tr>
                     <tr>
                        <td>이용시 주의사항</td>
                        <td>2022.01.01</td>
                     </tr>
                  </tbody></table>
                  <div class="moreM"  onclick="location.href='<%= request.getContextPath()%>/information'"> 
                  	Read More</div>
               </div>
               </div>
             </div>
           </div>
         </div>
       </div>
     </section>

  <!-- end info section -->

  <!-- food section -->

  <section class="food_section layout_padding-bottom">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>
          One Class
        </h2>
      </div>

      <ul class="filters_menu">
        <li class="active" data-filter="*">All</li>
        <li data-filter=".burger">베이킹</li>
        <li data-filter=".pizza">음료</li>
        <li data-filter=".pasta">동양디저트</li>
        <li data-filter=".fries">기타</li>
      </ul>

      <div class="filters-content">
        <div class="row grid">
          <div class="col-sm-6 col-lg-4 all pizza">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://cdn.class101.net/images/4c25a592-d484-4d2f-bde0-c448a0f62b2d/375xauto.webp" alt="">
                </div>
                <div class="detail-box">
                  <h5>
                    티애나 Tea Class
                  </h5>
                  <p>
                   내 최애 음료가 Tea였다고?? 건강하고 맛있게 즐기는 Tea음료 만들기 
                  </p>
                  <div class="options">
                    <h6>
                     
                    </h6>
                    <a href="">
                      <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                        <g>
                          <g>
                            <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                         c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                         C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                         c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                         C457.728,97.71,450.56,86.958,439.296,84.91z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                         c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                          </g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                      </svg>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 all burger">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://cdn.class101.net/images/87ef7d5c-88a3-496e-867c-7a1b88f3bce5/375xauto.webp" alt="">
                </div>
                <div class="detail-box">
                  <h5>
                    라비앙로즈 디저트 베이킹Class
                  </h5>
                  <p>
                    "원리부터 데코까지 알차게!" 초보자도 만들수 있는 호텔 비주얼 디저트베이킹
                  </p>
                  <div class="options">
                    <h6>
                      
                    </h6>
                    <a href="">
                      <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                        <g>
                          <g>
                            <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                         c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                         C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                         c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                         C457.728,97.71,450.56,86.958,439.296,84.91z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                         c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                          </g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                      </svg>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 all pizza">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://cdn.class101.net/images/b3e503b9-f024-4b8d-8d46-989a57fe9a57/375xauto.webp" alt="">
                </div>
                <div class="detail-box">
                  <h5>
                    커퓨쳐스 카페음료 Class
                  </h5>
                  <p>
                    취미부터 창업까지 카페음료는 커퓨쳐스에서 꼼꼼히 배우세요
                  </p>
                  <div class="options">
                    <h6>
                      
                    </h6>
                    <a href="">
                      <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                        <g>
                          <g>
                            <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                         c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                         C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                         c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                         C457.728,97.71,450.56,86.958,439.296,84.91z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                         c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                          </g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                      </svg>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 all pasta">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://cdn.class101.net/images/87a370fd-f54b-4c92-a53b-7f4b6926409f/375xauto.webp" alt="">
                </div>
                <div class="detail-box">
                  <h5>
                    미뜰리에 화과자 Class
                  </h5>
                  <p>
                    3분이면 화과자 반죽이 완성 !! 전자레인지로 만드는 아기자기한 화과자
                  </p>
                  <div class="options">
                    <h6>
                      
                    </h6>
                    <a href="">
                      <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                        <g>
                          <g>
                            <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                         c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                         C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                         c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                         C457.728,97.71,450.56,86.958,439.296,84.91z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                         c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                          </g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                      </svg>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 all fries">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://cdn.class101.net/images/6f7d8d85-54c2-487e-b7cc-b23f4197d087/375xauto.webp" alt="">
                </div>
                <div class="detail-box">
                  <h5>
                    츄밀리스튜디오 펫푸드 Class
                  </h5>
                  <p>
                    널 위한 건강한 수제간식 ,나도 펫푸드 전문가가 될 수 있어요
                  </p>
                  <div class="options">
                    <h6>
                      
                    </h6>
                    <a href="">
                      <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                        <g>
                          <g>
                            <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                         c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                         C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                         c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                         C457.728,97.71,450.56,86.958,439.296,84.91z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                         c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                          </g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                      </svg>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 all pizza">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://cdn.class101.net/images/41891962-9b9a-4a74-91a3-c14540eb298a/375xauto.webp" alt="">
                </div>
                <div class="detail-box">
                  <h5>
                   테이린 한방차 Class
                  </h5>
                  <p>
                    내몸을 가볍게 ! 한방음료 만들기 
                  </p>
                  <div class="options">
                    <h6>
                      
                    </h6>
                    <a href="">
                      <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                        <g>
                          <g>
                            <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                         c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                         C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                         c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                         C457.728,97.71,450.56,86.958,439.296,84.91z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                         c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                          </g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                      </svg>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 all burger">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://cdn.class101.net/images/dd83c6bf-0a42-466f-b280-aa1716c8f5ed/375xauto.webp" alt="">
                </div>
                <div class="detail-box">
                  <h5>
                    키스더브래드 홈베이킹 Class
                  </h5>
                  <p>
                    전문도구 없이도 집에서 가능한 『키스더브래드』 홈베이킹 클래스
                  </p>
                  <div class="options">
                    <h6>
                      
                    </h6>
                    <a href="">
                      <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                        <g>
                          <g>
                            <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                         c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                         C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                         c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                         C457.728,97.71,450.56,86.958,439.296,84.91z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                         c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                          </g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                      </svg>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 all burger">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://cdn.class101.net/images/c7a58c73-d1d3-4adb-8d7b-e814354c0e2f/375xauto.webp" alt="">
                </div>
                <div class="detail-box">
                  <h5>
                    처리의 케이크베이킹 Class
                  </h5>
                  <p>
                    베이킹 초보자를 위한 레트로 빈티지 케이크 동화속 한순간을 담은 홈카페를 완성하세요
                  </p>
                  <div class="options">
                    <h6>
                      
                    </h6>
                    <a href="">
                      <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                        <g>
                          <g>
                            <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                         c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                         C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                         c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                         C457.728,97.71,450.56,86.958,439.296,84.91z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                         c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                          </g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                      </svg>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 all pasta">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://cdn.class101.net/images/06b884f1-8563-493a-88fb-05bca5f417ee/375xauto.webp" alt="">
                </div>
                <div class="detail-box">
                  <h5>
                    김미라 한식디저트 Class
                  </h5>
                  <p>
                    유니크하고 모던한 한식 디저트 클래스
                  </p>
                  <div class="options">
                    <h6>
                      
                    </h6>
                    <a href="">
                      <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                        <g>
                          <g>
                            <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                         c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                         C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                         c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                         C457.728,97.71,450.56,86.958,439.296,84.91z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                         c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                          </g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                      </svg>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="btn-box">
        <a href="<%= request.getContextPath()%>/list.one">
          View More
        </a>
      </div>
    </div>
  </section>


  <!-- end food section -->

  <!-- about section -->

  <section class="about_section layout_padding">
    <div class="container  ">

      <div class="row">
        <div class="col-md-6 ">
          <div class="detail-box" id="inquiry_index_wrap">
            <div class="heading_container" id="inquiry_index">
              <h2>
                FAQ
              </h2>
              <table class="inquiry_table">
                <tbody>
                  <tr>
                    <td colspan="3" style="width: 65%;">
                      디저트 킹덤 공지는 어디서 확인하나요?
                    </td >
                    <td style="width: 15%;">
                      
                    </td>
                    <td>
                      관리자
                    </td>
                  </tr>
                  <tr>
                    <td colspan="3">
                      클래스 예약은 어떻게 하나요?
                    </td >
                    <td>
                     
                    </td>
                    <td>
                      관리자
                    </td>
                  </tr>
                  <tr>
                    <td colspan="3">
                      클래스 결제는 어떻게 하나요?
                    </td >
                    <td>
                    </td>
                    <td>
                      관리자
                    </td>
                  </tr>
                  <tr>
                    <td colspan="3">
                      공간 대관은 어떻게 하나요?
                    </td >
                    <td>
                    </td>
                    <td>
                      관리자
                    </td>
                  </tr>
                  <tr>
                    <td colspan="3">
                      공간 대관 비용은 어떻게 되나요?
                    </td >
                    <td>
                    </td>
                    <td>
                      관리자
                    </td>
                  </tr>
                  <tr>
                    <td colspan="3">
                      현금 영수증 및 세금계산서 발행은 어떻게 하나요?
                    </td >
                    <td>
                    </td>
                    <td>
                      관리자
                    </td>
                  </tr>
                  <tr>
                    <td colspan="3">
                      취소 및 환불 규정은 어떻게 되나요?
                    </td >
                    <td>
                    </td>
                    <td>
                      관리자
                    </td>
                  </tr>
                </tbody>
              </table> 
            </div>

            <a href="<%= request.getContextPath()%>/list.faq">
              Read More
            </a>
          </div>
        </div>
        <div class="col-md-6">
          <div class="detail-box" id="inquiry_index_wrap">
            <div class="heading_container" id="inquiry_index">
              <h2>
                Q&amp;A
              </h2>
              <table class="inquiry_table">
                <tbody>
                  <tr>
                    <td colspan="3" style="width: 55%;">
                      클래스 예약 문의드립니다!!
                    </td >
                    <td style="width: 25%;">
                      22.04.12
                    </td>
                    <td>
                      강건강
                    </td>
                  </tr>
                      <tr>
                    <td colspan="3">
                      수강 신청 어디서 해야하나요?
                    </td >
                    <td>
                      22.04.12
                    </td>
                    <td>
                      남나눔
                    </td>
                  </tr>
                  <tr>
                    <td colspan="3">
                      다음주 클래스인데 오늘 시간 변경 가능한가요?
                    </td >
                    <td>
                      22.04.16
                    </td>
                    <td>
                      도대담
                    </td>
                  </tr>
                  <tr>
                    <td colspan="3">
                      키즈 클래스 언제 또 오픈하나요?
                    </td >
                    <td>
                      22.04.20
                    </td>
                    <td>
                      나정수
                    </td>
                  </tr>
                  <tr>
                    <td colspan="3">
                       마카롱 클래스는 언제 개설되나요?
                    </td >
                    <td>
                      22.04.29
                    </td>
                    <td>
                      박춘희
                    </td>
                  </tr>
                  <tr>
                    <td colspan="3">
                      5월 쿠키 클래스 관련 문의합니다
                    </td >
                    <td>
                      22.04.30
                    </td>
                    <td>
                      박신우
                    </td>
                  </tr>
                  <tr>
                    <td colspan="3">
                      수강 연장 문의
                    </td >
                    <td>
                      22.05.05
                    </td>
                    <td>
                      김준복
                    </td>
                  </tr>
                </tbody>
              </table> 
            </div>

            <a href="<%= request.getContextPath()%>/list.faq">
              Read More
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end about section -->

  <!-- book section -->
   
   <!-- end book section -->

  <!-- client section -->

  <section class="client_section layout_padding-bottom">
    <div class="container" style="padding: 90px 0">
      <div class="heading_container heading_center psudo_white_primary mb_45">
        <h2>
          Review
        </h2>
      </div>
      <div class="carousel-wrap row ">
        <div class="owl-carousel client_owl-carousel">
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
              	똥손인 제가 성공..
                </p>
                <h6>
                     마카롱 만들기 클래스
                </h6>
                <p>
                     user01
                </p>
              </div>
              <div class="img-box">
                <img src="https://imgur.com/WXC77OC.jpg" alt="" class="box-img">
              </div>
            </div>
          </div>
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
               먹기만 하던 제가..
                </p>
                <h6>
                      전통 떡 만들기 클래스
                </h6>
                <p>
                     user01
                </p>
              </div>
              <div class="img-box">
                <img src="https://imgur.com/cBAckzT.jpg" alt="" class="box-img">
              </div>
            </div>
          </div>
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
               팔아도 될 정도입니다!!
                </p>
                <h6>
                     카페 음료 클래스
                </h6>
                <p>
                     user01
                </p>
              </div>
              <div class="img-box">
                <img src="https://imgur.com/k1kKJHO.jpg" alt="" class="box-img">
              </div>
            </div>
          </div>
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
                    다들 맛있다고 하네요!
                </p>
                <h6>
                        구움과자 클래스
                </h6>
                <p>
                       user01
                </p>
              </div>
              <div class="img-box">
                <img src="https://imgur.com/XyY3SXM.jpg" alt="" class="box-img">
              </div>
            </div>
          </div>
        </div>
        <div class="moreM" id="readBtn" onclick="location.href='<%= request.getContextPath() %>/list.th'"> Read More</div>
        
        
      </div>
    </div>
  </section>

  <!-- end client section -->

  <!--  footer -->
  <%@ include file="WEB-INF/views/common/footer.jsp" %>

  <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- owl slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <!-- isotope js -->
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <!-- nice select -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
  </script>
  <!-- End Google Map -->

</body>

</html>
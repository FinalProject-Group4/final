<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top5 Dieters 통계</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>


<!-- Resources -->
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

<style>
 
body, #li, h2, .col-md-6 {font-family: 'InfinitySans-RegularA1'!important;}

#chartdiv {
  width: 100%;
  height: 300px;
}

img {
    width: 170px;
    height: 180px;
    margin-left: 30px;
    margin-bottom: 20px;
    }
    
#p2 {font-size: 20px; text-align: center; line-height: 30px; margin-left: 30px;}


</style>


</head>
<body>
        <div style="margin: 100px;">
           <h2 class="content">Statistics of Dieters </h2>
           <hr>
                     
            <li class="li">TOP5 Dieters</li>
            <br>
               <div class="row">
                 <div class="col-sm-2" style="display: inline-block;">              
                  <canvas id="myChart" height="300" width="350"></canvas></div>
                   <div class="col-sm-1" style="display: inline-block;">
                   
                   <p id="p2">"<strong>${Member}</strong>"님 <br>축하합니다!</p>
                   
                   <a href="#" onclick="result();"><img src="${pageContext.request.contextPath}/resources/images/1st.png"
                             class="card-img-top"> </a></div>
                            
                <script>

                var ctx = document.getElementById('myChart').getContext('2d');
                var chart = new Chart(ctx, {
                    
                    type: 'bar',

                    data: {
                        labels: ['Top 1', 'Top 2', 'Top 3', 'Top 4', 'Top 5'],
                        datasets: [{
                            label: '커뮤니티 게시글 수',
                            backgroundColor: '#df80ff',
                            borderColor: 'rgb(255, 99, 132)',
                            data: [${totalContents}, ${totalContents2}, ${totalContents3}, ${totalContents4}, ${totalContents5}]
                        }]
                    },

               
                    options: {
                        responsive: false,
                        legend: {
                              display: false
                          },
                        hover: {
                           animationDuration: 800
                        },
                        animation: {
                           animateScale: true,
                           duration: 1000,
                           onComplete: function () {
                              var chartInstance = this.chart,
                                 ctx = chartInstance.ctx;
                              ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
                              ctx.fillStyle = 'black';
                              ctx.textAlign = 'center';
                              ctx.textBaseline = 'bottom';
               
                              this.data.datasets.forEach(function (dataset, i) {
                                 var meta = chartInstance.controller.getDatasetMeta(i);
                                 meta.data.forEach(function (bar, index) {
                                    var data = dataset.data[index];                     
                                    ctx.fillText(data, bar._model.x, bar._model.y - 5);
                                 });
                              });
                           }
                        },
                        scales: {
                           yAxes: [{
                              ticks: {
                                 beginAtZero: true,
                                 stepSize : 2,
                                 fontSize : 14,
                              }
                           }]
                        }
                     }
                  });

                </script>
                </div>
               
               <hr>
                <br>

               <div class="col-md-6" style="display: none" id="result">
               <!-- Chart code -->
               <script>
               am4core.ready(function() {
               
               // Themes begin
               am4core.useTheme(am4themes_animated);
               // Themes end
               
               // Create chart instance
               var chart = am4core.create("chartdiv", am4charts.PieChart);
               
               // Add data
               chart.data = [ {
                 "country": "관리자에게",
                 "litres": 14.286
               }, {
                 "country": "식단",
                 "litres": 28.571
               }, {
                 "country": "운동",
                 "litres": 28.571
               }, {
                 "country": "팁&노하우",
                 "litres": 0
               }, {
                 "country": "고민&질문",
                 "litres": 28.571
               } ];
               
               // Add and configure Series
               var pieSeries = chart.series.push(new am4charts.PieSeries());
               pieSeries.dataFields.value = "litres";
               pieSeries.dataFields.category = "country";
               pieSeries.slices.template.stroke = am4core.color("#fff");
               pieSeries.slices.template.strokeWidth = 2;
               pieSeries.slices.template.strokeOpacity = 1;
               
               // This creates initial animation
               pieSeries.hiddenState.properties.opacity = 1;
               pieSeries.hiddenState.properties.endAngle = -90;
               pieSeries.hiddenState.properties.startAngle = -90;
               
               }); // end am4core.ready()
               </script>
               
               <!-- HTML -->
               <div id="chartdiv"></div>
            </div>
            
            <script>
            function result() {

            	document.getElementById("result").style = "width: 100%; height: 300px;"
                }


            </script>




</body>
</html>
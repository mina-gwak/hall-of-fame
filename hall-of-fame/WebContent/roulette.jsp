<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>룰렛</title>
<script src="./js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/base.css" />
<script src="./js/base.js"></script>
<link rel="stylesheet" href="./css/category.css" />
<script src="./js/category.js"></script>
<script src="./js/Winwheel.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
</head>
<body>
<%@include file="./header.jsp" %>
<div class="category-nav">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="category-header">
					<h1 class="category-title">룰렛</h1>
					<div class="roulette-desc">
						<p>룰렛을 돌려 무엇을 먹을지 정해보세요</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="roulette">
					<canvas id='myCanvas' width='400' height='400'>
    				Canvas not supported, use another browser.
					</canvas>
					<div class="roulette-btns">
						<button id="bigButton" class="roulette-btn" onclick="theWheel.startAnimation(); this.disabled=true;">돌리기</button>
						<a href="javascript:void(0);" class="roulette-btn" onclick="theWheel.stopAnimation(false); theWheel.rotationAngle=0; theWheel.draw(); drawTriangle(); bigButton.disabled=false;">리셋</a>												
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
    let theWheel = new Winwheel({
        'canvasId'    : 'myCanvas',
        'numSegments' : 6,
        'outerRadius' : 170,
        'segments'       :
            [
               {'fillStyle' : '#B4A794', 'text' : '한식'},
               {'fillStyle' : '#6D6050', 'text' : '일식'},
               {'fillStyle' : '#B4A794', 'text' : '양식'},
               {'fillStyle' : '#6D6050', 'text' : '분식'},
               {'fillStyle' : '#B4A794', 'text' : '패스트푸드'},
               {'fillStyle' : '#6D6050', 'text' : '중식'}
            ],
            'animation' :
            {
                'type'     : 'spinToStop',
                'duration' : 2,
                'spins'    : 8,
     
                'callbackFinished' : 'alertPrize()',
     
                'callbackAfter' : 'drawTriangle()'
            }
    });
    
    function alertPrize()
    {
        let winningSegment = theWheel.getIndicatedSegment();
 
        alert("오늘의 메뉴는 " + winningSegment.text + "입니다.");
    }
 
    drawTriangle();
 
    function drawTriangle()
    {
        let ctx = theWheel.ctx;
 
        ctx.strokeStyle = 'black';    
        ctx.fillStyle   = 'black';    
        ctx.lineWidth   = 2;
        ctx.beginPath();         
        ctx.moveTo(170, 5);        
        ctx.lineTo(230, 5);        
        ctx.lineTo(200, 40);
        ctx.lineTo(171, 5);
        ctx.stroke();               
        ctx.fill();                  
    }
</script>
<%@include file="./footer.jsp" %>
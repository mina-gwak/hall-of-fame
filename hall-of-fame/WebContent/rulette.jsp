<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 먹지 룰렛 수정중</title>
        <div id="판"><div id="핀"></div><canvas id="canvas" width="1000px" height="1000px"></canvas></div>
        <style>
            #판 {width: 1000px; height: 1000px; overflow: hidden; position: relative;}
            #핀 {width: 0; height: 0; top: 170px; left: calc(50% - 16px); position: absolute; border-radius: 32px 32px 0 0; border-top: 70px solid crimson; border-left: 16px solid transparent; border-right: 16px solid transparent; border-bottom: 0; z-index: 1;}
        </style>

</head>
<body>
      <canvas id="canvas" width="1000px" height="1000px"></canvas>

      <script> (function(){
          const FILL = 0;  const STROKE = 1; var renderType = FILL; const multiplyCurrentTransform = true;
          var measure = function(ctx, text, radius){ var textWidth = ctx.measureText(text).width; return {width: textWidth, angularWidth: (1 / radius) * textWidth, pixelAngularSize: 1 / radius };}
          var circleText = function (ctx, text, x, y, radius, start, end, forward) {
              var i, textWidth, pA, pAS, a, aw, wScale, aligned, dir, fontSize;
              if(text.trim() === "" || ctx.globalAlpha === 0){ return;}
              if(isNaN(x) || isNaN(y) || isNaN(radius) || isNaN(start) || (end !== undefined && end !== null && isNaN(end))){ throw TypeError("circle text arguments requires a number for x,y, radius, start, and end.") }
              aligned = ctx.textAlign; dir = forward ? 1 : forward === false ? -1 : 1; pAS = 1 / radius;
              textWidth = ctx.measureText(text).width;
              if (end !== undefined && end !== null) { pA = ((end - start) / textWidth) * dir; wScale = (pA / pAS) * dir; } else {
                  if(forward === null || forward === undefined){if(((start % (Math.PI * 2)) + Math.PI * 2) % (Math.PI * 2) > Math.PI){dir = -1;}}
                  pA = -pAS * dir; wScale = -1 * dir;
                  switch (aligned) {
                  case "center":
                      start -= (pA * textWidth )/2; end = start + pA * textWidth; break;
                  case "right":
                  case "end": end = start; start -= pA * textWidth; break;
                  case "left":
                  case "start": end = start + pA * textWidth;}}
              ctx.textAlign = "center"; a = start;
              for (var i = 0; i < text.length; i += 1) {
                  aw = ctx.measureText(text[i]).width * pA;
                  var xDx = Math.cos(a + aw / 2);
                  var xDy = Math.sin(a + aw / 2);
                  if(multiplyCurrentTransform){
                      ctx.save();
                      if (xDy < 0) {ctx.transform(-xDy * wScale, xDx * wScale, -xDx, -xDy, xDx * radius + x, xDy * radius + y);
                      } else {ctx.transform(-xDy * wScale, xDx * wScale, xDx, xDy, xDx * radius + x, xDy * radius + y);}
                  } else {
                      if (xDy < 0) {ctx.setTransform(-xDy * wScale, xDx * wScale, -xDx, -xDy, xDx * radius + x, xDy * radius + y);}
                      else { ctx.setTransform(-xDy * wScale, xDx * wScale, xDx, xDy, xDx * radius + x, xDy * radius + y);}}
                  if(renderType === FILL){ctx.fillText(text[i], 0, 0);} else {ctx.strokeText(text[i], 0, 0);} if(multiplyCurrentTransform){ctx.restore();}
                  a += aw;
              }
              if(!multiplyCurrentTransform){ ctx.setTransform(1, 0, 0, 1, 0, 0);} ctx.textAlign = aligned;}
          var fillCircleText = function(text, x, y, radius, start, end, forward){renderType = FILL; circleText(this, text, x, y, radius, start, end, forward);}
          var strokeCircleText = function(text, x, y, radius, start, end, forward){renderType = STROKE; circleText(this, text, x, y, radius, start, end, forward);}
          var measureCircleTextExt = function(text,radius){return measure(this, text, radius);}
          CanvasRenderingContext2D.prototype.fillCircleText = fillCircleText;
          CanvasRenderingContext2D.prototype.strokeCircleText = strokeCircleText;
          CanvasRenderingContext2D.prototype.measureCircleText = measureCircleTextExt;})();
      
      
            var 사은품목록 = new Array(
                {
                    품명: '한식',
                    색상: '#FFADC5'
                },
                {
                    품명: '양식',
                    색상: '#B8F3B8'
                },
                {
                    품명: '중식',
                    색상: '#CCD1FF'
                },
                {
                    품명: '일식',
                    색상: '#FFDDA6'
                },
                {
                    품명: '패스트푸드',
                    색상: '#FFCCCC'
                },
                {
                    품명: '분식',
                    색상: '#A8C8F9'
                },
                {
                    품명: '펍',
                    색상: '#9197B5'
                }
            );
            
            var canvas = document.getElementById('canvas');
            var ctx = canvas.getContext('2d');
            
            ctx.translate(500, 500);
            
            사은품목록.forEach(function(e, i) {
                
                ctx.beginPath();
                ctx.arc(0, 0, 300, 0, (360/사은품목록.length)*(Math.PI/180), false);
                ctx.lineTo(0, 0);
                ctx.closePath();
                ctx.fillStyle = e.색상;
                ctx.fill();
                
                ctx.fillStyle = 'white';
                ctx.textAlign = 'left';
                ctx.font = '14px sanserif';
                ctx.fillCircleText(e.품명, 0, 0, 290, (-2+360/사은품목록.length)*(Math.PI/180) );
                
                ctx.rotate( (360/사은품목록.length) * (Math.PI/180) );
            });
            ctx.beginPath();
            ctx.arc(0, 0, 200, 0, 2*Math.PI, false);
            ctx.fillStyle = 'white';
            ctx.fill();
            
            ctx.textAlign = 'center';
            ctx.textBaseline = 'middle';
            ctx.font = '30px sanserif';
            
            ctx.strokeStyle = '#FFADC5';
            ctx.strokeText('오늘          ', 0, 0);
            ctx.strokeStyle = '#B8F3B8';
            ctx.strokeText('       뭐      ', 0, 0);
            ctx.strokeStyle = '#CCD1FF';
            ctx.strokeText('             먹지?', 0, 0);
            
                      
            var 랜덤 = 0;
           $('#canvas').on({
                'click': function() {
                       랜덤 += Math.random()*360 + 720;
                    $(this).css({'transition-timing-function': 'ease-in-out', 'transition': '5s', 'transform': 'rotate('+랜덤+'deg)'});
                },
                'transitionend': function() {alert('당첨!');}
            });
        </script>
</body>
</html>
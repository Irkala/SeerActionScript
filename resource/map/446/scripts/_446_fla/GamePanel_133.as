package _446_fla
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.sampler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol324")]
   public dynamic class GamePanel_133 extends MovieClip
   {
      
      public var point3:MovieClip;
      
      public var point4:MovieClip;
      
      public var point5:MovieClip;
      
      public var point6:MovieClip;
      
      public var point7:MovieClip;
      
      public var point8:MovieClip;
      
      public var point9:MovieClip;
      
      public var closeBtn:SimpleButton;
      
      public var tipMC:MovieClip;
      
      public var linesMC:MovieClip;
      
      public var point1:MovieClip;
      
      public var point2:MovieClip;
      
      public var lineArr:Array;
      
      public var pointArr:Array;
      
      public var rightNum:int;
      
      public function GamePanel_133()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function init() : void
      {
         var _loc1_:MovieClip = null;
         rightNum = 0;
         pointArr = [];
         linesMC.mouseChildren = linesMC.mouseEnabled = false;
         lineArr = [point1,point2,point3,point4,point5,point6,point7,point8,point9];
         for each(_loc1_ in lineArr)
         {
            _loc1_.addEventListener(MouseEvent.CLICK,pointClickHandler);
         }
         closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
      }
      
      public function destroy() : void
      {
         var _loc1_:MovieClip = null;
         for each(_loc1_ in lineArr)
         {
            _loc1_.removeEventListener(MouseEvent.CLICK,pointClickHandler);
         }
         closeBtn.removeEventListener(MouseEvent.CLICK,closeHandler);
         trace("游戏结束");
      }
      
      public function playLine(param1:MovieClip) : void
      {
         var line:MovieClip = param1;
         if(line.currentFrame == 1)
         {
            ++rightNum;
            line.gotoAndPlay(2);
            line.addFrameScript(25,function():void
            {
               if(rightNum == 4)
               {
                  linesMC["lineMC"].gotoAndPlay(2);
               }
            });
         }
      }
      
      public function checkPoint() : void
      {
         var _loc1_:MovieClip = null;
         if(pointArr.length == 2)
         {
            for each(_loc1_ in pointArr)
            {
               _loc1_.gotoAndStop(1);
               trace(_loc1_.name);
            }
            if([point3,point7].indexOf(pointArr[0]) >= 0 && [point3,point7].indexOf(pointArr[1]) >= 0)
            {
               playLine(linesMC["line1"]);
            }
            if([point7,point1].indexOf(pointArr[0]) >= 0 && [point7,point1].indexOf(pointArr[1]) >= 0)
            {
               playLine(linesMC["line2"]);
            }
            if([point2,point6].indexOf(pointArr[0]) >= 0 && [point2,point6].indexOf(pointArr[1]) >= 0)
            {
               playLine(linesMC["line3"]);
            }
            if([point9,point7].indexOf(pointArr[0]) >= 0 && [point9,point7].indexOf(pointArr[1]) >= 0)
            {
               playLine(linesMC["line4"]);
            }
            pointArr.length = 0;
         }
      }
      
      public function pointClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         if(_loc2_.currentFrame == 1)
         {
            _loc2_.gotoAndStop(2);
            pointArr.push(_loc2_);
            checkPoint();
         }
         else
         {
            _loc2_.gotoAndStop(1);
            pointArr.splice(_loc2_,1);
         }
      }
      
      public function closeHandler(param1:MouseEvent) : void
      {
         this.visible = false;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}


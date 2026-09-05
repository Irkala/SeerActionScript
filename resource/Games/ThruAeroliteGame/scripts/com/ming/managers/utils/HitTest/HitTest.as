package com.ming.managers.utils.HitTest
{
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class HitTest
   {
      
      public function HitTest()
      {
         super();
      }
      
      public static function hitTestRect(diso_1:DisplayObject, diso_2:DisplayObject) : Boolean
      {
         if(diso_1 == null || diso_2 == null)
         {
            return false;
         }
         if(diso_1.hitTestObject(diso_1))
         {
            return true;
         }
         return false;
      }
      
      public static function hitTestPixel(diso_1:DisplayObject, diso_2:DisplayObject) : Boolean
      {
         if(diso_1 == null || diso_2 == null)
         {
            return false;
         }
         var p1x:Number = diso_1.getRect(diso_1).x;
         var p1y:Number = diso_1.getRect(diso_1).y;
         var p2x:Number = diso_2.getRect(diso_2).x;
         var p2y:Number = diso_2.getRect(diso_2).y;
         var p1w:Number = diso_1.width;
         var p1h:Number = diso_1.height;
         var p2w:Number = diso_2.width;
         var p2h:Number = diso_2.height;
         p1w = p1w < 1 ? 1 : p1w;
         p1h = p1h < 1 ? 1 : p1h;
         p2w = p2w < 1 ? 1 : p2w;
         p2h = p2h < 1 ? 1 : p2h;
         var bmpData1:BitmapData = new BitmapData(p1w,p1h,true,0);
         var bmpData2:BitmapData = new BitmapData(p2w,p2h,true,0);
         bmpData1.draw(diso_1,new Matrix(1,0,0,1,-p1x,-p1y));
         bmpData2.draw(diso_2,new Matrix(1,0,0,1,-p2x,-p2y));
         var gp1:Point = diso_1.localToGlobal(new Point(p1x,p1y));
         var gp2:Point = diso_2.localToGlobal(new Point(p2x,p2y));
         var b:Boolean = bmpData1.hitTest(gp1,5,bmpData2,gp2,5);
         bmpData1.dispose();
         bmpData2.dispose();
         return b;
      }
      
      public static function hitTestPoint(pointDiso:DisplayObject, diso_2:DisplayObject) : Boolean
      {
         if(pointDiso == null || diso_2 == null)
         {
            return false;
         }
         if(diso_2.hitTestPoint(pointDiso.x,pointDiso.y,true))
         {
            return true;
         }
         return false;
      }
      
      public static function hitTestShape(diso_1:DisplayObject, diso_2:DisplayObject) : Boolean
      {
         var bHit:Boolean = false;
         if(diso_1.hitTestObject(diso_2))
         {
            if(diso_2.width < 20 && diso_2.height < 20)
            {
               bHit = true;
            }
            else if(HitTest.hitTestPixel(diso_1,diso_2))
            {
               bHit = true;
            }
         }
         return bHit;
      }
   }
}


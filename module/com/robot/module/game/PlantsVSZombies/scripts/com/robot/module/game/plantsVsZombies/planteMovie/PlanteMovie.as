package com.robot.module.game.plantsVsZombies.planteMovie
{
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   import org.taomee.display.BitmapFramePlayer;
   import org.taomee.utils.BitmapDataUtil;
   import org.taomee.utils.DisplayUtil;
   
   public class PlanteMovie extends Sprite
   {
      
      private var bmpArray:Array = [];
      
      private var bmp_1:BitmapFramePlayer;
      
      private var bmp_2:BitmapFramePlayer;
      
      private var bmp_3:BitmapFramePlayer;
      
      public function PlanteMovie(array:Array)
      {
         var i:uint = 0;
         var cls:Class = null;
         var bmpdata:BitmapData = null;
         var offset:Point = null;
         super();
         var count:uint = 0;
         for each(i in array)
         {
            cls = getDefinitionByName("plante_" + i) as Class;
            bmpdata = new cls(1,1) as BitmapData;
            array = BitmapDataUtil.makeList(bmpdata,PlantsXMLInfo.getWidth(i),PlantsXMLInfo.getHeight(i),PlantsXMLInfo.getFrames(i),true);
            offset = PlantsXMLInfo.getOffSetPoint(i);
            if(count == 0)
            {
               bmp_1 = new BitmapFramePlayer();
               bmp_1.dataList = array;
               bmp_1.x = -offset.x;
               bmp_1.y = -offset.y;
            }
            else if(count == 1)
            {
               bmp_2 = new BitmapFramePlayer();
               bmp_2.dataList = array;
               bmp_2.x = -offset.x;
               bmp_2.y = -offset.y;
               bmp_2.addEventListener(BitmapFramePlayer.END_MOVIE,onEndMovie);
            }
            else if(count == 2)
            {
               bmp_3 = new BitmapFramePlayer();
               bmp_3.dataList = array;
               bmp_3.x = -offset.x;
               bmp_3.y = -offset.y;
               bmp_3.addEventListener(BitmapFramePlayer.END_MOVIE,onEndMovie);
            }
            count++;
         }
         bmpArray = [bmp_1,bmp_2,bmp_3];
         if(bmp_1)
         {
            addChild(bmp_1);
            bmp_1.play();
         }
      }
      
      public function gotoAndStop(frame:uint) : void
      {
         var b:BitmapFramePlayer = bmpArray[frame - 1];
         if(b)
         {
            DisplayUtil.removeAllChild(this);
            addChild(b);
            b.play();
         }
      }
      
      public function destroy() : void
      {
         if(bmp_2)
         {
            bmp_2.removeEventListener(BitmapFramePlayer.END_MOVIE,onEndMovie);
         }
         if(bmp_3)
         {
            bmp_3.removeEventListener(BitmapFramePlayer.END_MOVIE,onEndMovie);
         }
         bmpArray = [];
         bmp_1 = null;
         bmp_2 = null;
         bmp_3 = null;
      }
      
      private function onEndMovie(event:Event) : void
      {
         var b:BitmapFramePlayer = event.currentTarget as BitmapFramePlayer;
         b.stop();
         b.gotoAndStop(1);
         gotoAndStop(1);
      }
   }
}


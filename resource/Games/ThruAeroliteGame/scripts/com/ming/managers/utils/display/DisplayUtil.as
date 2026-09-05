package com.ming.managers.utils.display
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   
   public class DisplayUtil
   {
      
      public function DisplayUtil()
      {
         super();
      }
      
      public static function stopAllMovieClip(disCon:DisplayObjectContainer) : void
      {
         var i:uint = 0;
         if(disCon != null && disCon.numChildren > 0)
         {
            for(i = 0; i < disCon.numChildren; i++)
            {
               (disCon.getChildAt(i) as MovieClip).stop();
            }
         }
      }
      
      public static function hasParent(dis:DisplayObject) : Boolean
      {
         if(dis != null && dis.parent != null)
         {
            return true;
         }
         return false;
      }
      
      public static function removeAllChild(disCon:DisplayObjectContainer) : void
      {
         var child:DisplayObject = null;
         if(disCon != null && disCon.numChildren > 0)
         {
            while(disCon.numChildren > 0)
            {
               child = disCon.removeChildAt(0);
               child = null;
            }
         }
      }
      
      public static function removeForParent(dis:DisplayObject) : void
      {
         if(dis != null && dis.parent != null)
         {
            dis.parent.removeChild(dis);
         }
      }
   }
}


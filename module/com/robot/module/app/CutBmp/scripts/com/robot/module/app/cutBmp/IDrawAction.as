package com.robot.module.app.cutBmp
{
   import flash.geom.Point;
   
   public interface IDrawAction
   {
      
      function destroy() : void;
      
      function set endPoit(param1:Point) : void;
      
      function set startPoint(param1:Point) : void;
   }
}


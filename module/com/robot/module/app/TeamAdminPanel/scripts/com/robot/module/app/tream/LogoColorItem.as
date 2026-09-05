package com.robot.module.app.tream
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import org.taomee.utils.DisplayUtil;
   
   public class LogoColorItem extends Sprite
   {
      
      public var txtColor:uint;
      
      public var bgColor:uint;
      
      public function LogoColorItem(bgColor:uint, txtColor:uint = 0)
      {
         super();
         this.buttonMode = true;
         this.bgColor = bgColor;
         this.txtColor = txtColor;
         var mc:MovieClip = new team_logo_colorItem();
         addChild(mc);
         DisplayUtil.FillColor(mc,bgColor);
         this.filters = [new GlowFilter(6710886,1,3,3,4)];
      }
   }
}


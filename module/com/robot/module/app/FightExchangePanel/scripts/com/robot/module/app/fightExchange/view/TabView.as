package com.robot.module.app.fightExchange.view
{
   import com.robot.container.Button;
   import flash.display.MovieClip;
   
   public class TabView extends Button
   {
      
      private var labelChanged:Boolean = false;
      
      public function TabView()
      {
         this.$listenMouseDown = true;
         this.$listenMouseOver = true;
         this.buttonMode = true;
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1 is PageView)
         {
            switch(param1.data)
            {
               case "精灵":
                  itemClass = exchangetab0;
                  break;
               case "装备":
                  itemClass = exchangetab1;
                  break;
               case "其它":
                  itemClass = exchangetab2;
                  break;
               case "物理攻击":
                  itemClass = secondCategory0;
                  break;
               case "特殊攻击":
                  itemClass = secondCategory1;
                  break;
               case "属性攻击":
                  itemClass = secondCategory2;
                  break;
               case "全部":
                  itemClass = thirdCategory0;
                  break;
               case "攻击":
                  itemClass = thirdCategory1;
                  break;
               case "防御":
                  itemClass = thirdCategory2;
                  break;
               case "特攻":
                  itemClass = thirdCategory3;
                  break;
               case "特防":
                  itemClass = thirdCategory4;
                  break;
               case "速度":
                  itemClass = thirdCategory5;
                  break;
               case "体力":
                  itemClass = thirdCategory6;
            }
         }
         else if(param1 is PageView1)
         {
            itemClass = exchangetab0;
         }
         else if(param1 is PageView2)
         {
            itemClass = exchangetab1;
         }
         this.labelChanged = true;
         InvalidateProperties();
      }
      
      override public function ValidateProperties() : void
      {
         if(this.labelChanged)
         {
            item = new itemClass();
            (item as MovieClip).gotoAndStop(3);
            this.addChild(item);
            this.width = item.width;
            this.height = item.height;
            this.labelChanged = false;
         }
      }
      
      override public function ValidateDisplayList() : void
      {
         if(invalidateDisplayListFlag)
         {
            if(selected)
            {
               item["bg"].gotoAndStop(3);
            }
            else
            {
               item["bg"].gotoAndStop(1);
            }
         }
         super.ValidateDisplayList();
      }
      
      override protected function $DrawDisabled() : void
      {
         if(item != null && !selected)
         {
            item["bg"].gotoAndStop(1);
         }
      }
      
      override protected function $DrawDown() : void
      {
         if(item != null && !selected)
         {
            item["bg"].gotoAndStop(3);
         }
      }
      
      override protected function $DrawOver() : void
      {
         if(item != null && !selected)
         {
            item["bg"].gotoAndStop(2);
         }
      }
      
      override protected function $DrawNormal() : void
      {
         if(item != null && !selected)
         {
            item["bg"].gotoAndStop(1);
         }
      }
      
      override public function set selected(param1:Boolean) : void
      {
         super.selected = param1;
         if(item != null)
         {
            if(selected)
            {
               item["bg"].gotoAndStop(3);
            }
            else
            {
               item["bg"].gotoAndStop(1);
            }
         }
      }
   }
}


package com.robot.module.app.mailBox.templatePanel
{
   import com.robot.core.config.ClientConfig;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.filters.GlowFilter;
   import org.taomee.component.UIComponent;
   import org.taomee.component.bgFill.SoildFillStyle;
   import org.taomee.component.control.MLoadPane;
   import org.taomee.manager.ResourceManager;
   
   public class SmallPicPanel extends UIComponent
   {
      
      private var _maskMC:MovieClip;
      
      private var _id:uint;
      
      private var loadPanel:MLoadPane;
      
      public function SmallPicPanel(id:uint)
      {
         super();
         this._id = id;
         loadPanel = new MLoadPane(null,MLoadPane.FIT_WIDTH);
         loadPanel.offsetRect = false;
         loadPanel.bgFillStyle = new SoildFillStyle(0);
         _maskMC = new ui_mailBox_smallMask();
         containSprite.addChild(_maskMC);
         containSprite.addChild(loadPanel);
         loadPanel.setSizeWH(_maskMC.width,_maskMC.height);
         loadPanel.mask = _maskMC;
         setSizeWH(_maskMC.width,_maskMC.height);
         mouseChildren = false;
         ResourceManager.getResource(ClientConfig.getMailTemplateUrl(id),onLoad,"item");
         this.filters = [new GlowFilter(10092543,1,2,2,20)];
      }
      
      private function onLoad(o:DisplayObject) : void
      {
         loadPanel.setIcon(o);
      }
      
      override public function destroy() : void
      {
         super.destroy();
         loadPanel = null;
         _maskMC = null;
         try
         {
            ResourceManager.cancel(ClientConfig.getMailTemplateUrl(id),onLoad);
         }
         catch(e:Error)
         {
         }
      }
      
      public function get id() : uint
      {
         return _id;
      }
   }
}


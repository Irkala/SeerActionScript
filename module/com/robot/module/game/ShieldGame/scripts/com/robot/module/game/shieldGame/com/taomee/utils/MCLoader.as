package com.robot.module.game.shieldGame.com.taomee.utils
{
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   
   public class MCLoader extends Loader
   {
      
      public static const INIT:String = "mcLoader_init";
      
      private var _url:URLRequest;
      
      private var _loadInit:Boolean = false;
      
      public function MCLoader()
      {
         super();
         addListeners();
      }
      
      private function initHandler(eo:Event) : void
      {
         this._loadInit = true;
         this.dispatchEvent(new Event(MCLoader.INIT));
      }
      
      override public function load(request:URLRequest, context:LoaderContext = null) : void
      {
         this._loadInit = false;
         super.load(request,context);
      }
      
      public function getMC(link_id:String, movieClipClass:MovieClip = null) : *
      {
         var result:Class = null;
         if(this._loadInit == false)
         {
            return movieClipClass;
         }
         result = this.contentLoaderInfo.applicationDomain.getDefinition(link_id) as Class;
         if(result != null)
         {
            return new result();
         }
         throw new Error("�ò���\t" + link_id + "\t影片剪辑");
      }
      
      private function addListeners() : void
      {
         this.contentLoaderInfo.addEventListener(Event.INIT,initHandler);
      }
   }
}


package com.robot.module.app.cutBmp
{
   import com.robot.core.event.RobotEvent;
   import com.robot.core.info.GetImgAddrInfo;
   import com.robot.core.manager.MainManager;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   import flash.system.Security;
   import flash.utils.ByteArray;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   
   public class UploadBmp
   {
      
      public function UploadBmp()
      {
         super();
      }
      
      private static function openHandler(event:Event) : void
      {
      }
      
      public static function upload(cutMapInfo:ByteArray, data:GetImgAddrInfo) : void
      {
         var loader:URLLoader;
         var header:URLRequestHeader;
         var request:URLRequest;
         var byte:ByteArray;
         Security.loadPolicyFile("http://" + data.ip + ":" + String(data.port) + "/crossdomain.xml");
         loader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.BINARY;
         byte = new ByteArray();
         byte.writeBytes(data.session);
         byte.writeBytes(cutMapInfo);
         configureListeners(loader);
         header = new URLRequestHeader("user-ID",String(MainManager.actorID));
         request = new URLRequest("http://" + data.ip + ":" + String(data.port) + "/cgi-bin/processor/screenshot_upload_processor.php");
         request.data = byte;
         request.method = URLRequestMethod.POST;
         request.contentType = "text/plain";
         request.requestHeaders.push(header);
         try
         {
            loader.load(request);
         }
         catch(error:Error)
         {
            trace("Unable to load requested document.");
         }
      }
      
      private static function completeHandler(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var url:String = "http://" + loader.data;
         trace(url);
         EventManager.dispatchEvent(new DynamicEvent(RobotEvent.CUT_BMP,url));
      }
      
      private static function configureListeners(dispatcher:IEventDispatcher) : void
      {
         dispatcher.addEventListener(Event.COMPLETE,completeHandler);
         dispatcher.addEventListener(Event.OPEN,openHandler);
         dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityErrorHandler);
         dispatcher.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
      }
      
      private static function securityErrorHandler(event:SecurityErrorEvent) : void
      {
         trace("securityErrorHandler: " + event);
      }
      
      private static function ioErrorHandler(event:IOErrorEvent) : void
      {
         trace("ioErrorHandler: " + event);
      }
   }
}


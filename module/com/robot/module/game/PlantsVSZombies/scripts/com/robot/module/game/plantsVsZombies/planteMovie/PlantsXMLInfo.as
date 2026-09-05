package com.robot.module.game.plantsVsZombies.planteMovie
{
   import flash.geom.Point;
   import org.taomee.ds.HashMap;
   
   public class PlantsXMLInfo
   {
      
      private static var xmllist:XMLList;
      
      private static var map:HashMap;
      
      private static var xml:XML = <root>
			<images>
				<!--依依-->
				<image id="10002" width="67" height="84" frames="31" offsetX="44" offsetY="73"/>
				<image id="10003" width="79" height="82" frames="43" offsetX="51" offsetY="72"/>
				<image id="10004" width="80" height="82" frames="8" offsetX="47" offsetY="70"/>
				<!--小豆芽-->
				<image id="10005" width="51" height="61" frames="45" offsetX="28" offsetY="53"/>
				<image id="10006" width="91" height="74" frames="20" offsetX="36" offsetY="66"/>
				<image id="10007" width="62" height="66" frames="8" offsetX="32" offsetY="63"/>
				<!--布布花-->
				<image id="10008" width="57" height="76" frames="28" offsetX="37" offsetY="69"/>
				<image id="10009" width="100" height="72" frames="26" offsetX="55" offsetY="63"/>
				<image id="10010" width="62" height="75" frames="8" offsetX="32" offsetY="73"/>
				<!--仙人球-->
				<image id="10011" width="48" height="66" frames="1" offsetX="26" offsetY="61"/>
				<image id="10012" width="60" height="73" frames="8" offsetX="29" offsetY="66"/>
				<!--粉尘-->
				<image id="10013" width="99" height="42" frames="12" offsetX="10" offsetY="31"/>
				<!--沙砾-->
				<image id="10014" width="108" height="55" frames="12" offsetX="18" offsetY="50"/>
				<!--沙尘暴-->
				<image id="10015" width="98" height="126" frames="9" offsetX="18" offsetY="118"/>
				<image id="10016" width="166" height="220" frames="6" offsetX="14" offsetY="214"/>
				
				<image id="10017" width="65" height="79" frames="1" offsetX="-1" offsetY="-2"/>
			</images>
		</root>;
      
      setup();
      
      public function PlantsXMLInfo()
      {
         super();
      }
      
      public static function getWidth(id:uint) : uint
      {
         var xml:XML = map.getValue(id);
         return xml.@width;
      }
      
      public static function getFrames(id:uint) : uint
      {
         var xml:XML = map.getValue(id);
         return xml.@frames;
      }
      
      public static function getHeight(id:uint) : uint
      {
         var xml:XML = map.getValue(id);
         return xml.@height;
      }
      
      public static function getOffSetPoint(id:uint) : Point
      {
         var xml:XML = map.getValue(id);
         return new Point(int(xml.@offsetX),int(xml.@offsetY));
      }
      
      private static function setup() : void
      {
         var i:XML = null;
         map = new HashMap();
         xmllist = xml.images.image;
         for each(i in xmllist)
         {
            map.add(uint(i.@id),i);
         }
      }
   }
}


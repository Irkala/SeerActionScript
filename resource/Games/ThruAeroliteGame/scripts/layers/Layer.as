package layers
{
   import com.ming.managers.utils.display.DisplayUtil;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   
   public class Layer extends Sprite
   {
      
      public static const GROUND:int = 1;
      
      public static const BULLET:int = 2;
      
      public static const SKY:int = 3;
      
      public static const PLAYER:int = 4;
      
      public static const BONUS:int = 5;
      
      public static const EXPLODE:int = 6;
      
      public var layerType:uint;
      
      private var _dropShadow:DropShadowFilter;
      
      private var _useShadow:Boolean = false;
      
      private var _blurX:Number = 2;
      
      private var _blurY:Number = 2;
      
      private var _shadowDistance:Number;
      
      private var _shadowAngle:Number;
      
      private var _shadowAlpha:Number;
      
      public function Layer(lt:uint)
      {
         super();
         layerType = lt;
         setShadowParm();
      }
      
      public function get useShadow() : Boolean
      {
         return _useShadow;
      }
      
      public function clearLayer() : void
      {
         DisplayUtil.removeAllChild(this);
      }
      
      public function set useShadow(b:Boolean) : void
      {
         if(layerType == Layer.BULLET)
         {
            return;
         }
         _useShadow = b;
         if(!_useShadow)
         {
            this.filters = [];
            _dropShadow = null;
         }
      }
      
      private function setShadowParm() : void
      {
         if(layerType == Layer.BULLET)
         {
            return;
         }
         switch(layerType)
         {
            case Layer.GROUND:
               _shadowDistance = 5;
               _shadowAngle = -30;
               _shadowAlpha = 0.3;
               break;
            case Layer.SKY:
               _shadowDistance = 35;
               _shadowAngle = -30;
               _shadowAlpha = 0.3;
               break;
            case Layer.PLAYER:
               _shadowDistance = 45;
               _shadowAngle = -30;
               _shadowAlpha = 0.3;
               break;
            case Layer.BONUS:
               _shadowDistance = 35;
               _shadowAngle = -30;
               _shadowAlpha = 0.3;
               break;
            default:
               _shadowDistance = 35;
               _shadowAngle = -30;
               _shadowAlpha = 0.3;
         }
      }
   }
}


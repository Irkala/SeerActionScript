package src.com
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   
   public class PaoPao extends MovieClip
   {
      
      private var _down:Boolean;
      
      private var _speed:Number = 0;
      
      private var _up:Boolean;
      
      private var _sspeed:Number = 0;
      
      private var _right:Boolean;
      
      public var _pao:MovieClip;
      
      private var _left:Boolean;
      
      private var _str:String;
      
      private var _contSpeed:int = 6;
      
      public function PaoPao(str:String)
      {
         super();
         _str = str;
      }
      
      private function movePao() : void
      {
         if(!_up && !_down)
         {
            if(_sspeed > 0)
            {
               _sspeed -= _sspeed * 0.1;
               if(_sspeed >= 0 && _sspeed < 0.5)
               {
                  _sspeed = 0;
               }
            }
            else if(_sspeed < 0)
            {
               _sspeed -= _sspeed * 0.1;
               if(_sspeed > -0.5 && _sspeed <= 0)
               {
                  _sspeed = 0;
               }
            }
         }
         else if(_up)
         {
            if(_sspeed > -_contSpeed)
            {
               _sspeed -= 0.2;
            }
         }
         else if(_down)
         {
            if(_sspeed < _contSpeed)
            {
               _sspeed += 0.2;
            }
         }
         if(!_left && !_right)
         {
            if(_speed > 0)
            {
               _speed -= _speed * 0.1;
               if(_speed >= 0 && _speed < 0.5)
               {
                  _speed = 0;
               }
            }
            else if(_speed < 0)
            {
               _speed -= _speed * 0.1;
               if(_speed > -0.5 && _speed <= 0)
               {
                  _speed = 0;
               }
            }
         }
         else if(_left)
         {
            if(_speed > -_contSpeed)
            {
               _speed -= 0.2;
            }
         }
         else if(_right)
         {
            if(_speed < _contSpeed)
            {
               _speed += 0.2;
            }
         }
         if(_pao.y < 112 || _pao.y > 506)
         {
            _sspeed = -_sspeed;
            hitQiang();
            _pao.scaleX *= 0.95;
            _pao.scaleY *= 0.95;
         }
         if(_pao.x < 258 || _pao.x > 684)
         {
            _speed = -_speed;
            hitQiang();
            _pao.scaleX *= 0.95;
            _pao.scaleY *= 0.95;
         }
         _pao.y += _sspeed;
         _pao.x += _speed;
      }
      
      public function destroy() : void
      {
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
         stage.removeEventListener(KeyboardEvent.KEY_UP,keyUpHandler);
      }
      
      public function init() : void
      {
         switch(_str)
         {
            case "草":
               _pao = new PaoPao9_ui();
               break;
            case "水":
               _pao = new PaoPao10_ui();
               break;
            case "火":
               _pao = new PaoPao11_ui();
               break;
            case "飞行":
               _pao = new PaoPao8_ui();
               break;
            case "电":
               _pao = new PaoPao7_ui();
               break;
            case "机械":
               _pao = new PaoPao4_ui();
               break;
            case "地面":
               _pao = new PaoPao6_ui();
               break;
            case "普通":
               _pao = new PaoPao2_ui();
               break;
            case "冰":
               _pao = new PaoPao3_ui();
               break;
            case "超能":
               _pao = new PaoPao1_ui();
               break;
            case "战斗":
               _pao = new PaoPao5_ui();
               break;
            case "暗影":
               _pao = new PaoPao0_ui();
         }
         addChild(_pao);
         _pao.x = 458;
         _pao.y = 216;
         stage.focus = stage;
         stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
         stage.addEventListener(KeyboardEvent.KEY_UP,keyUpHandler);
      }
      
      private function keyUpHandler(e:KeyboardEvent) : void
      {
         var code:int = int(e.keyCode);
         switch(code)
         {
            case 37:
               _left = false;
               break;
            case 38:
               _up = false;
               break;
            case 39:
               _right = false;
               break;
            case 40:
               _down = false;
         }
      }
      
      private function keyDownHandler(e:KeyboardEvent) : void
      {
         var code:int = int(e.keyCode);
         switch(code)
         {
            case 37:
               _left = true;
               break;
            case 38:
               _up = true;
               break;
            case 39:
               _right = true;
               break;
            case 40:
               _down = true;
         }
      }
      
      private function hitQiang() : void
      {
         dispatchEvent(new Event("pengqiang"));
      }
      
      public function enterFrame() : void
      {
         movePao();
      }
      
      public function get paoW() : int
      {
         return int(_pao.width);
      }
   }
}


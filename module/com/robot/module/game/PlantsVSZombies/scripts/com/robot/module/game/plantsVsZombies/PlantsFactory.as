package com.robot.module.game.plantsVsZombies
{
   import com.robot.module.game.plantsVsZombies.plants.IPlants;
   import com.robot.module.game.plantsVsZombies.plants.Plant_1;
   import com.robot.module.game.plantsVsZombies.plants.Plant_2;
   import com.robot.module.game.plantsVsZombies.plants.Plant_3;
   import com.robot.module.game.plantsVsZombies.plants.Plant_4;
   
   public class PlantsFactory
   {
      
      public function PlantsFactory()
      {
         super();
      }
      
      public static function createPlants(type:uint, xIndex:uint) : IPlants
      {
         var plantes:IPlants = null;
         switch(type)
         {
            case 1:
               plantes = new Plant_1();
               break;
            case 2:
               plantes = new Plant_2();
               break;
            case 3:
               plantes = new Plant_3();
               break;
            case 4:
               plantes = new Plant_4();
               break;
            default:
               plantes = new Plant_1();
         }
         plantes.xIndex = xIndex;
         return plantes;
      }
   }
}


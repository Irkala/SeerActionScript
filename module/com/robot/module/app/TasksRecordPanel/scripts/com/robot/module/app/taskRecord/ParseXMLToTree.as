package com.robot.module.app.taskRecord
{
   import com.robot.core.display.tree.INode;
   import com.robot.core.display.tree.StatefulNode;
   import com.robot.core.display.tree.Tree;
   import com.robot.core.manager.TasksManager;
   import com.robot.module.app.taskRecord.menu.INodeData;
   import com.robot.module.app.taskRecord.menu.NodeData;
   import com.robot.module.app.taskRecord.menu.NodeDataReader;
   
   public class ParseXMLToTree
   {
      
      private var _tree:Tree;
      
      public function ParseXMLToTree(xml:XML)
      {
         super();
         var nodeDataReader:NodeDataReader = new NodeDataReader(XML(xml["tasks"]));
         var _root:StatefulNode = new StatefulNode("tree",null);
         _tree = new Tree(_root);
         toTree(tree.root,nodeDataReader.read());
      }
      
      private function toTree(parent:INode, data:INodeData) : void
      {
         var dt:INodeData = null;
         var node:StatefulNode = null;
         for each(dt in data.nodeDataArray)
         {
            if(dt is NodeData)
            {
               node = new StatefulNode(NodeData(dt).name,parent,dt);
               if((dt as NodeData).newOnline == "1")
               {
                  if(TasksManager.getTaskStatus(uint((dt as NodeData).id)) == TasksManager.UN_ACCEPT)
                  {
                     node.isNewAndUN = true;
                  }
               }
               if(node.layer == 1)
               {
                  node.setOpen(true);
               }
               parent.addChild(node);
               toTree(node,dt);
            }
         }
      }
      
      public function get tree() : Tree
      {
         return _tree;
      }
   }
}


package com.terrynoya.uieditor.core
{
    import com.terrynoya.common.core.MUIComponent;
    import com.terrynoya.uieditor.events.MTransformToolKitEvent;

    import flash.events.MouseEvent;
    import flash.geom.Point;

    /**
     * 发送变换消息
     */
    [Event(name="mtransform_toolkit_update",type="com.terrynoya.uieditor.events.MTransformToolKitEvent")]

    /**
     * MUITransformContainer
     * 拥有8个控制点的变换工具，点之间用直线相连，鼠标悬停在直线上可以拖动，控制点可以改变高宽
     * @author TerryYao
     */
    public class MUIToolKit extends MUIComponent
    {

        private var _nodeWidth:Number = 5;

        private var _nodeHeight:Number = 5;
		
        //控制节点view
        private var _nodes:Array

        private var _width:Number = 100;

        private var _height:Number = 100;

        private var _currDragIndex:int = -1;

        private var _downPoint:Point;

        private var _offsetPoint:Point;

        //8个控制点抽象为矩阵的信息点,初始化时点和1取^得到另外4个点的矩阵信息
        private var _points:Array = [ 
            new Point(0, 0), 
            new Point(0.5, 0), 
            new Point(1, 0), 
            new Point(1, 0.5)
            ];

        /**
         *
         * 控制节点宽度
         **/
        public function get nodeWidth():Number
        {
            return this._nodeWidth;
        }

        /**
         *
         * 控制节点高度
         **/
        public function get nodeHeight():Number
        {
            return this._nodeHeight;
        }

        override public function set width(value:Number):void
        {
            this._width = value;
            this.updateView();

        }

        override public function get width():Number
        {
            return this._width;
        }

        override public function set height(value:Number):void
        {
            this._height = value;
            this.updateView();
        }

        override public function get height():Number
        {
            return this._height;
        }

        /**
         *
         */
        public function MUIToolKit()
        {
            super();
        }

        override protected function createChildren():void
        {
            super.createChildren();
            this._nodes = new Array();
            //创建8个方向的可视化控制点
            for (var i:int = 0; i < 8; i++)
            {
                var transformNode:MTransformNode = new MTransformNode();
                transformNode.addEventListener(MouseEvent.MOUSE_DOWN, onNodeMouseDown);
                this._nodes.push(transformNode);
                this.addChild(transformNode);
            }

            this._downPoint = new Point(0, 0);
            this._offsetPoint = new Point(0, 0);

            var arr:Array = this._points.concat(this.get4Points());

            this._points = arr;
        }

        private function get4Points():Array
        {
            var arr:Array = [];
            for (var i:int = 0; i < this._points.length; i++)
            {
                var point:Point = this._points[i];
                var nx:Number = this.getTransformedFact(point.x, 1);
                var ny:Number = this.getTransformedFact(point.y, 1);
                arr.push(new Point(nx, ny));
            }
            return arr;
        }

        override protected function updateView():void
        {
            super.updateView();
            var startPoint:Point = this._points[0];

            this.graphics.clear();
            this.graphics.lineStyle(1,0x000000);
            var sx:Number = startPoint.x * this.width;
            var sy:Number = startPoint.y * this.height;
            this.graphics.moveTo(sx,sy);

            var node:MTransformNode;

            for (var i:int = 0; i < this._points.length; i++)
            {
                node = this._nodes[i];
                var point:Point = this._points[i];
                node.x = point.x * this.width;
                node.y = point.y * this.height;
                this.graphics.lineTo(node.x + node.width/2,node.y + node.height/2);
            }
            this.graphics.lineTo(sx + node.width/2,sy + node.height/2);

            this.dispatch();
        }

        /**
         * 	将变换信息打包派发消息
         */
        private function dispatch():void
        {
            var info:MTransformInfo = new MTransformInfo();
            info.width = this.width;
            info.height = this.height;
            info.x = this.x;
            info.y = this.y;

            var evt:MTransformToolKitEvent = 
                new MTransformToolKitEvent(MTransformToolKitEvent.UPDATE,
                                           info);
            this.dispatchEvent(evt);
        }

        /**
         *	初始化的4个点和因子(1)取^
         * 	得到另外4个点的位置矩阵信息
         */
        private function getTransformedFact(num:Number, fact:int):Number
        {
            var rlt:Number = num;
            if (num != 0.5)
            {
                rlt = num ^ fact;
            }
            return rlt;
        }

        private var _downWdith:Number;

        private var _downHeight:Number;

        private var _downx:Number;

        private var _downy:Number;

        private function onNodeMouseDown(e:MouseEvent):void
        {

            var index:int = this._nodes.indexOf(e.currentTarget);
            this._currDragIndex = index;
            this.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
            this.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);

            var node:MTransformNode = this._nodes[index];

            this._downPoint = new Point(e.stageX, e.stageY);
            this._downWdith = this.width;
            this._downHeight = this.height;
            this._downx = this.x;
            this._downy = this.y;

        }

        private function onMouseMove(e:MouseEvent):void
        {
            var currPoint:Point = new Point(e.stageX, e.stageY);
            this._offsetPoint = currPoint.subtract(this._downPoint);
            var index:int = this._currDragIndex;
            var point:Point = this._points[index];

            if (point.x == 0)
            {
                this.x = this._downx + this._offsetPoint.x;
                this.width = this._downWdith - this._offsetPoint.x;
            }
            else if (point.x == 1)
            {
                this.width = this._downWdith + this._offsetPoint.x;
            }

            if (point.y == 0)
            {
                this.y = this._downy + this._offsetPoint.y;
                this.height = this._downHeight - this._offsetPoint.y;
            }
            else if (point.y == 1)
            {
                this.height = this._downHeight + this._offsetPoint.y;
            }
        }

        private function onMouseUp(e:MouseEvent):void
        {
            this.stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
            this.stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
            this._currDragIndex = -1;
        }
    }
}

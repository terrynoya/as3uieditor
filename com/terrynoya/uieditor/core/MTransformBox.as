package com.terrynoya.uieditor.core
{
    import com.terrynoya.common.core.MUIComponent;
    import com.terrynoya.uieditor.events.MTransformToolKitEvent;

    import flash.events.MouseEvent;
    import flash.geom.Point;

    /**
     * 视图编辑器中的UI控件变换容器
     * @author TerryYao
     */
    public class MTransformBox extends MUIComponent implements IMTransformBox
    {
        private var _transformToolKit:MUIToolKit;

        private var _content:IMUIRender;

        /**
         *
         */
        public function MTransformBox()
        {
            super();
            this.createRender();
            this.renderCreated();
            this.addListeners();
        }

        /**
         * 初始化MUIRender
         * @param render
         */
        protected function createRender():void
        {
            //this method must be overridden
        }

        protected function renderCreated():void
        {
            this._transformToolKit.width = this._content.width;
            this._transformToolKit.height = this._content.height;
            this.setChildIndex(this._transformToolKit,this.numChildren-1);
            this.updateView();
        }

        override protected function createChildren():void
        {
            super.createChildren();
            this._transformToolKit = new MUIToolKit();
            this.addChild(this._transformToolKit);
        }

        override protected function updateView():void
        {
            super.updateView();
            this._content.x = this._transformToolKit.nodeWidth / 2;
            this._content.y = this._transformToolKit.nodeHeight / 2;
        }

        /**
         *
         * @return
         */
        protected function get content():IMUIRender
        {
            return this._content;
        }

        protected function set content(value:IMUIRender):void
        {
            this._content = value;
        }

        private function addListeners():void
        {
            this._transformToolKit.addEventListener(MTransformToolKitEvent.UPDATE,onTransfromUpdate);
            this._content.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
        }

        private function onTransfromUpdate(e:MTransformToolKitEvent):void
        {
            var info:MTransformInfo = e.transfromInfo;
			
            this._content.width = info.width;
            this._content.height = info.height;

            this._content.x = info.x + this._transformToolKit.nodeWidth/2;
            this._content.y = info.y + this._transformToolKit.nodeHeight/2;
        }

        private function startDraging():void
        {
            this.stage.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
            this.stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
        }

        private function stopDraging():void
        {
            this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
            this.stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
        }

        private var _downPoint:Point;

        private var _downPos:Point;

        private function onMouseDown(e:MouseEvent):void
        {
            this.startDraging();
            this._downPoint = new Point(e.stageX,e.stageY);
            this._downPos = new Point(this.x,this.y);
        }

        private function onMouseMove(e:MouseEvent):void
        {
            var currPoint:Point = new Point(e.stageX,e.stageY);
            var offsetPoint:Point = currPoint.subtract(this._downPoint);
            this.x = this._downPos.x + offsetPoint.x;
            this.y = this._downPos.y + offsetPoint.y;
        }

        private function onMouseUp(e:MouseEvent):void
        {
            this.stopDraging();
        }

    }
}


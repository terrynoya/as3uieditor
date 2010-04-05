package com.terrynoya.uieditor.renders
{
	import com.terrynoya.uieditor.core.MUIRender;
	import com.terrynoya.uieditor.skin.halo.slider.IMSliderRenderSkin;
	import com.terrynoya.uieditor.skin.halo.slider.MSliderRenderSkin;
	
	import flash.display.DisplayObject;
	public class MSliderRender extends MUIRender
	{
		
		private var _track:DisplayObject;
		
		private var _thumb:DisplayObject;
		
		private var _renderSkin:IMSliderRenderSkin;
		
		public function MSliderRender()
		{
			super();
		}
		
		override public function get width():Number
		{
			return this._track.width;
		}
		
		override public function set width(value:Number):void
		{
			this._track.width = value;
		}
		
		override public function get height():Number
		{
			return Math.max(this._track.height,this._thumb.height);
		}
		
		override public function set height(value:Number):void
		{
			
		}
				
		override protected function createChildren():void
		{
			super.createChildren();
			this._renderSkin = new MSliderRenderSkin(); 
			
			this._track = this._renderSkin.tackSkin;
			this._thumb = this._renderSkin.thumbSkin;
			
			this.addChild(this._track);
			this.addChild(this._thumb);
			
			this._thumb.y = -Math.abs((this._thumb.height - this._track.height)/2);
		}
	}
}
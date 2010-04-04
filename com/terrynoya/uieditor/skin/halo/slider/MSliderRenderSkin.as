package com.terrynoya.uieditor.skin.halo.slider
{
	import flash.display.DisplayObject;

	public class MSliderRenderSkin implements IMSliderRenderSkin
	{
		private var _trackSkin:DisplayObject;
		
		private var _sliderSkin:DisplayObject;
		
		public function MSliderRenderSkin()
		{
			super();
			this._trackSkin = new MSliderTrackRenderSkin();
		}
		
		public function get tackSkin():DisplayObject
		{
			return this._trackSkin; 
		}
		public function get thumbSkin():DisplayObject
		{
			return this._trackSkin; 
		}
	}
}
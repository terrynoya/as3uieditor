package com.terrynoya.uieditor.skin.halo
{
	import com.terrynoya.common.skins.halo.MSkin;
	
	import flash.display.GradientType;

	public class MButtonRenderSkin extends MSkin implements IMRenderSkin 
	{
		private var cr:Number=4;
		private var cr1:Number=Math.max(0, cornerRadius - 1);
		private var cr2:Number=Math.max(0, cornerRadius - 2);
		
		public function MButtonRenderSkin()
		{
			super();
			this.w=100;
			this.h=30;
			
			this.draw();
		}
		
		override protected function draw():void
		{
			this.graphics.clear();
			var upFillColors:Array=[fillColors[0], fillColors[1]];

			var upFillAlphas:Array=[fillAlphas[0], fillAlphas[1]];
			var emph:Boolean=false;

			// button border/edge
			drawRoundRect(
				0, 0, w, h, cr,
				[ borderColor, borderColorDrk1 ], 1,
				verticalGradientMatrix(0, 0, w, h ),
				GradientType.LINEAR, null, 
				{ x: 1, y: 1, w: w - 2, h: h - 2, r: cornerRadius - 1 });

			// button fill
			drawRoundRect(
				1, 1, w - 2, h - 2, cr1,
				upFillColors, upFillAlphas,
				verticalGradientMatrix(1, 1, w - 2, h - 2));

			// top highlight
			drawRoundRect(
				1, 1, w - 2, (h - 2) / 2,
				{ tl: cr1, tr: cr1, bl: 0, br: 0 },
				[ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
				verticalGradientMatrix(1, 1, w - 2, (h - 2) / 2));
		}
	}
}
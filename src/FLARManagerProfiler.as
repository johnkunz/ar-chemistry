package {
	import com.transmote.flar.FLARManager;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	[SWF(width="640", height="480", frameRate="30", backgroundColor="#FFFFFF")]
	public class FLARManagerProfiler extends Sprite {
		private var flarManager:FLARManager;
		
		public function FLARManagerProfiler () {
			this.init();
		}
		
		private function init () :void {
			this.initFLARManager();
			this.stage.addEventListener(MouseEvent.CLICK, this.onClick);
		}
		
		private function initFLARManager () :void {
			this.flarManager = new FLARManager("../resources/flar/flarConfig.xml");
			this.addChild(Sprite(this.flarManager.flarSource));
		}
		
		private function destroyFLARManager () :void {
			this.removeChild(Sprite(this.flarManager.flarSource));
			this.flarManager.dispose();
			this.flarManager = null;
		}
		
		private function onClick (evt:MouseEvent) :void {
			if (this.flarManager) {
				this.destroyFLARManager();
			} else {
				this.initFLARManager();
			}
		}
	}
}
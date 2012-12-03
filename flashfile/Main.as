package
{
	import flash.desktop.NativeApplication;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.sampler.NewObjectSample;
	import flash.ui.Keyboard;
	
	import rvf.socket.Client;
	
	public class Main extends MovieClip
	{
		private var client:Client;
		private var startWindow:WinStart;
		private var spelWindow:WinSpelen;
		private var sc:ServerConnecter;
		private var accountWindow:WinInschrijven;
		public function Main()
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyboardHandler);
			
			client = new Client();
			
			startWindow = new WinStart(client);
			stage.addChild(startWindow);
			
			spelWindow=new WinSpelen();
			spelWindow.x=854;
			stage.addChild(spelWindow);
			accountWindow=new WinInschrijven();
		
			startWindow.btnSpelen.addEventListener(MouseEvent.CLICK,btnSpelenClick);
		}
		
		private function btnSpelenClick():void
		{
			spelWindow.x=0;
		}
		
		protected function KeyboardHandler(evt:KeyboardEvent) {
			switch(evt.keyCode) {
				case Keyboard.BACK:
					evt.preventDefault();
					evt.stopImmediatePropagation();
					
					NativeApplication.nativeApplication.exit();
					
					break;
			}
		}
		
		public static function trim(s:String ):String {
			return s.replace( /^([\r|\s|\t|\n]+)?(.*)([\r|\s|\t|\n]+)?$/gm, "$2" );
		}
	}
}
package
{
	import flash.desktop.NativeApplication;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.sampler.NewObjectSample;
	import flash.ui.Keyboard;
	
	import rvf.socket.Client;
	
	public class Main extends MovieClip
	{
		private var client:Client;
		private var st:WinStart;
		private var sc:ServerConnecter;
		//matthias
		//deru
		
		
		//preute leute
		public function Main()
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyboardHandler);
			
			client = new Client();
			
			st = new WinStart(client);
			stage.addChild(st);
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
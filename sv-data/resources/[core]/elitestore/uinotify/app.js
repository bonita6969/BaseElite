$(document).ready(function(){
	var notifyNumber = 0;
	window.addEventListener("message",function(event){
		var html = `
		<style>
		@keyframes bounce-in-left{0%{transform:translateX(-600px);animation-timing-function:ease-in;opacity:0}38%{transform:translateX(0);animation-timing-function:ease-out;opacity:1}55%{transform:translateX(-68px);animation-timing-function:ease-in}72%{transform:translateX(0);animation-timing-function:ease-out}81%{transform:translateX(-28px);animation-timing-function:ease-in}90%{transform:translateX(0);animation-timing-function:ease-out}95%{transform:translateX(-8px);animation-timing-function:ease-in}100%{transform:translateX(0);animation-timing-function:ease-out}}

		</style>
			<div id='${event.data.css}' style="animation:bounce-in-left .5s both;" >
				${event["data"]["mensagem"]}
				<div class="timer-bar ${notifyNumber}"></div>
			</div>
		`;
		$(html)
		.appendTo("#notifications") 
		.delay(event["data"]["timer"])
		.fadeOut(1000);
		$(`.${notifyNumber}`).css('transition', `width ${event["data"]["timer"]}ms`);
		
		setTimeout(() => {
			$(`.${notifyNumber}`).css('width', '0%');
			notifyNumber += 1;
		},100);
	});
});
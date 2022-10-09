	$(function(){
		var container = $("body");
		var atual 
		 container.hide()
		// ? MENSAGENS
			window.addEventListener('message',function(event){
				var item = event.data;
				switch(item.action){
					case 'showMenu':
				updateGarages();
				container.show()
				actionContainer.fadeIn(1000);
			break;

			case 'hideMenu':
				container.hide()
				actionContainer.fadeOut(1000);
			break;

			case 'updateGarages':
				updateGarages();
			break;
				}
		
			});

	document.onkeyup = function(data){
		if (data.which == 27){
			sendData("ButtonClick","exit")
		}
	};
	const updateGarages = () => {
		$.post('http://elite_garages/myVehicles',JSON.stringify({}),(data) => {
			const nameList = data.vehicles.sort((a,b) => (a.name2 > b.name2) ? 1: -1);
			
			$('#listaVeiculos').html(`
				
				${nameList.map((item) => (`

			<div class="veiculo" data-status='${item.status}' data-ipva='${item.ipva}' data-name="${item.name}" data-name2="${item.name2}" data-engine="${item.engine}" data-body="${item.body}" data-fuel="${item.fuel}">
                        <div class="nameCar">${item.name2}</div>
                        <div class="center">
                            <img src="http://131.196.197.44/vrp_vehicles/${item.name}.png" alt="" id="fotoCarro">
                        </div>
                    </div>

				`)).join('')}
			`);

			var vehicles = document.getElementsByClassName("veiculo")
			$("#nomeCarro").text($(vehicles[0]).data("name2"))

			$("#taxa").text($(vehicles[0]).data("status"))
			$("#detido").text($(vehicles[0]).data("ipva"))



			$("#detido").text($(vehicles[0]).data("status"))
			$("#taxa").text($(vehicles[0]).data("ipva"))
			$("#engine").text(`${$(vehicles[0]).data("engine")}%`)
			$("#latariapercent").text(`${$(vehicles[0]).data("body")}%`)
			$("#fuel").text(`${$(vehicles[0]).data("fuel")}%`)
			$("#fotoCarro2").css("background-image",`url(http://131.196.197.44/vrp_vehicles/${$(vehicles[0]).data("name")}.png )` )
			
			$(vehicles[0]).addClass("active")
		});
		

	}
});

const formatarNumero = (n) => {
	var n = n.toString();
	var r = '';
	var x = 0;

	for (var i = n.length; i > 0; i--) {
		r += n.substr(i - 1, 1) + (x == 2 && i != 1 ? '.' : '');
		x = x == 2 ? 0 : x + 1;
	}
	return r.split('').reverse().join('');
}

const sendData = (name,data) => {
	$.post("http://elite_garages/"+name,JSON.stringify(data),function(datab){});
}

$(document).on('click','.veiculo',function(){
	let $el = $(this);
	let isActive = $el.hasClass('ativada');
	if (isActive) return;
	$('.veiculo').removeClass('ativada');
    if(!isActive) $el.addClass('ativada');
    

	$("#nomeCarro").text($(this).data("name2"))
    $("#engine").text(`${$(this).data("engine")}%`)

	$("#taxa").text($(this).data("ipva"))
    $("#detido").text($(this).data("status"))


    $("#latariapercent").text(`${$(this).data("body")}%`)
    $("#fuel").text(`${$(this).data("fuel")}%`)
	$("#fotoCarro2").css("background-image",`url(http://131.196.197.44/vrp_vehicles/${$(this).data("name")}.png)`)

});

$(document).on('click','#retirar',function(){
	let $el = $('.veiculo.ativada');
	if($el) {
		$.post('http://elite_garages/spawnVehicles',JSON.stringify({
			name: $el.attr('data-name')
		}));
	}
})


$(document).on('click','#guardar',function(){
	$.post('http://elite_garages/deleteVehicles',JSON.stringify({}));
})
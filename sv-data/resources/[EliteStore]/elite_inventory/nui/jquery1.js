const pastaName = 'inventario'; /* Nome da pasta onde se está as imagens no XAMMP */
const IPend = '131.196.197.44' ; /* IP da VPS ond está hospedada as imagens */

const mySlots = 50;
const inSlots = 100;

var selectType = "Buy";
let shiftPressed = true;
let type = ""
var useItems = false


$(document).ready(function () {
	window.addEventListener("message", function (event) {
		if (event.data.log) { type = event.data.log; }
		switch (event.data.action) {
			
			case "hideNUI":
				$(".inventory").css("display", "none")
			break

			case "showMochila":
				updateMochila();
				updateArmamento();
				$(".inventory").css("display", "flex")
			break;

			case "updateMochila":
				updateMochila();
				// updateArmamento();
			break;
			
			case "updateArmamento":
				updateArmamento();
			break;
		}
	});

	document.onkeydown = data => {
		const key = data.key;
		if (key === "Shift") {
			shiftPressed = true;
		}
	}

	document.onkeyup = data => {
		const key = data.key;
		if (key === "Escape") {
			$.post("http://elite_inventory/invClose", JSON.stringify({type : type}));
			type = "";
			$("#circ").html("");
		} else if (key === "Shift") {
			shiftPressed = false;
		}
	};

	$('body').mousedown(e => {
		if (e.button == 1) return false;
	});
});

let weightLeft = 0;
let maxWeightLeft = 0;

const updateDrag = () => {
	$('.populated').draggable({
		helper: 'clone'
	});

	$('.armadinho').draggable({
		helper: 'clone',

	});

	$('.close').click(function() {
		$.post("http://elite_inventory/invClose", JSON.stringify({}));
		$("#circ").html("");

	});
	
	$('.imagem-perso').click(function() {
        $.post("http://elite_inventory/invClose", JSON.stringify({}));
        $("#circ").html("");
        $.post("http://elite_inventory/takePhoto", JSON.stringify({}));
    });

	$('.empty').droppable({
		hoverClass: 'hoverControl',
		drop: function (event, ui) {
			if (ui.draggable.parent()[0] == undefined) return;

			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined) return;
			const tInv = $(this).parent()[0].className;

			if (origin === "invRight" && tInv === "invRight") return;
			if (origin === "slotskeybind" && tInv === "invRight") return;

			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
			const target = $(this).data('slot');

			if (itemData.key === undefined || target === undefined) return;

			let amount = 0;
			let itemAmount = parseInt(ui.draggable.data('amount'));

			if ($(".amount").val() == "" | parseInt($(".amount").val()) == 0)
				amount = itemAmount;
			else
				amount = parseInt($(".amount").val());


			if (amount > itemAmount)
				amount = itemAmount;

			$('.populated, .empty, .use').off("draggable droppable");

			let clone1 = ui.draggable.clone();
			let slot2 = $(this).data("slot");

			if (amount == itemAmount) {
				let clone2 = $(this).clone();
				let slot1 = ui.draggable.data("slot");

				$(this).replaceWith(clone1);
				ui.draggable.replaceWith(clone2);

				$(clone1).data("slot", slot2);
				$(clone2).data("slot", slot1);
			} else {
				let newAmountOldItem = itemAmount - amount;
				let weight = parseFloat(ui.draggable.children(".top").children(".itemWeight").html());
				let weightPerItem = (weight / itemAmount).toFixed(2);
				let newWeightClone1 = (amount * weightPerItem).toFixed(2);
				let newWeightOldItem = (newAmountOldItem * weightPerItem).toFixed(2);

				ui.draggable.data("amount", newAmountOldItem);

				clone1.data("amount", amount);

				$(this).replaceWith(clone1);
				$(clone1).data("slot", slot2);

				ui.draggable.children(".top").children(".itemAmount").html(ui.draggable.data("amount") + "x");
				ui.draggable.children(".top").children(".itemWeight").html(newWeightOldItem);

				$(clone1).children(".top").children(".itemAmount").html(clone1.data("amount") + "x");
				$(clone1).children(".top").children(".itemWeight").html(newWeightClone1);
			}

			let futureWeightLeft = weightLeft;

			if (origin === "invLeft" && tInv === "invRight") {
				futureWeightLeft = futureWeightLeft - (parseFloat(ui.draggable.data('peso')) * amount);
			} else if (origin === "invRight" && tInv === "invLeft") {
				futureWeightLeft = futureWeightLeft + (parseFloat(ui.draggable.data('peso')) * amount);
			 }else if (origin === "slotskeybind" && tInv === "invLeft") {
				futureWeightLeft = futureWeightLeft + (parseFloat(ui.draggable.data('peso')) * amount);
			}

			weightLeft = futureWeightLeft;
			updateDrag();

			if (origin === "invLeft" && tInv === "invLeft") {
				if (!useItems){
				$.post("http://elite_inventory/updateSlot", JSON.stringify({
					item: itemData.key,
					slot: itemData.slot,
					target: target,
					amount: parseInt($(".amount").val())
				}))};
			} else if (origin === "invRight" && tInv === "invLeft") {
				const id = ui.draggable.data("id");
				const flex = ui.draggable.data("flex");				
				$.post("http://elite_inventory/pickupItem", JSON.stringify({
					id: id,
					target: target,
					amount: parseInt($(".amount").val())
				}));
			} else if (origin === "invLeft" && tInv === "invRight") {
				$.post("http://elite_inventory/dropItem", JSON.stringify({
					item: itemData.key,
					slot: itemData.slot,
					amount: parseInt($(".amount").val())
				}));
			} else if (origin === "slotskeybind" && tInv === "invLeft") {
				$.post("http://elite_inventory/updateSlotArmado", JSON.stringify({
					item: itemData.key,
					target: target,
					ammo: parseInt(ui.draggable.data('item-ammo')),
				}));
				$.post("http://elite_inventory/invClose", JSON.stringify({}));
				$("#circ").html("");
			}

			$('.amount').val("");
		}
	});

	$('.populated').droppable({
		hoverClass: 'hoverControl',
		drop: function (event, ui) {
			if (ui.draggable.parent()[0] == undefined) return;

			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined) return;
			const tInv = $(this).parent()[0].className;

			if (origin === "slotskeybind") return;

			if (origin === "invRight" && tInv === "invRight") return;

			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
			const target = $(this).data('slot');

			if (itemData.key === undefined || target === undefined) return;

			let amount = 0;
			let itemAmount = parseInt(ui.draggable.data('amount'));

			if ($(".amount").val() == "" | parseInt($(".amount").val()) == 0)
				amount = itemAmount;
			else
				amount = parseInt($(".amount").val());

			if (amount > itemAmount)
				amount = itemAmount;

			$('.populated, .empty, .use').off("draggable droppable");

			let futureWeightLeft = weightLeft;

			if (ui.draggable.data('item-key') == $(this).data('item-key')) {
				let newSlotAmount = amount + parseInt($(this).data('amount'));
				let newSlotWeight = parseFloat(ui.draggable.children(".top").children(".itemWeight").html()) + parseFloat($(this).children(".top").children(".itemWeight").html());

				$(this).data('amount', newSlotAmount);
				$(this).children(".top").children(".itemAmount").html(newSlotAmount + "x");
				$(this).children(".top").children(".itemWeight").html(newSlotWeight.toFixed(2));

				if (amount == itemAmount) {
					ui.draggable.replaceWith(`<div class="item empty" data-slot="${ui.draggable.data('slot')}"></div>`);
				} else {
					let newMovedAmount = itemAmount - amount;
					let newMovedWeight = newMovedAmount * parseFloat(ui.draggable.data("peso"));

					ui.draggable.data('amount', newMovedAmount);
					ui.draggable.children(".top").children(".itemAmount").html(newMovedAmount + "x");
					ui.draggable.children(".top").children(".itemWeight").html(newMovedWeight.toFixed(2));
				}

				if (origin === "invLeft" && tInv === "invRight") {
					futureWeightLeft = futureWeightLeft - (parseFloat(ui.draggable.data('peso')) * amount);
				} else if (origin === "invRight" && tInv === "invLeft") {
					futureWeightLeft = futureWeightLeft + (parseFloat(ui.draggable.data('peso')) * amount);
				}
			} else {
				if (origin === "invRight" && tInv === "invLeft") return;

				let clone1 = ui.draggable.clone();
				let clone2 = $(this).clone();

				let slot1 = ui.draggable.data("slot");
				let slot2 = $(this).data("slot");

				if (origin === "invLeft" && tInv === "invRight") {
					futureWeightLeft = futureWeightLeft - parseFloat(ui.draggable.data('amount')) + parseFloat($(this).data('amount'));
				}

				ui.draggable.replaceWith(clone2);
				$(this).replaceWith(clone1);

				$(clone1).data("slot", slot2);
				$(clone2).data("slot", slot1);
			}

			updateDrag();

			if (origin === "invLeft" && tInv === "invLeft") {
				$.post("http://elite_inventory/updateSlot", JSON.stringify({
					item: itemData.key,
					slot: itemData.slot,
					target: target,
					amount: parseInt($(".amount").val())
				}));
			} else if (origin === "invRight" && tInv === "invLeft") {
				const id = ui.draggable.data("id");
				const grid = ui.draggable.data("grid");
				$.post("http://elite_inventory/pickupItem", JSON.stringify({
					id: id,
					target: target,
					amount: parseInt($(".amount").val())
				}));
			} else if (origin === "invLeft" && tInv === "invRight") {
				$.post("http://elite_inventory/dropItem", JSON.stringify({
					item: itemData.key,
					slot: itemData.slot,
					amount: parseInt($(".amount").val())
				}));
			}

			$('.amount').val("");
		}
	});

	$('.use').droppable({
		hoverClass: 'hoverControl',
		drop: function (event, ui) {
			$("#innerInventory").hide();
			useItems = true

			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined || origin === "invRight") return;
			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };

			if (itemData.key === undefined) return;
			if (origin === "slotskeybind") return;

			$.post("http://elite_inventory/useItem", JSON.stringify({
				item: itemData.key,
				slot: itemData.slot,
				amount: parseInt(parseInt($(".amount").val()))
			}));
			$('.amount').val("");
			$("#circ").html("");
			
			window.setTimeout(function(){  /*TIME DE USO PRA NÃO USAR DE NOVO OS ITENS */
			useItems = false
			$("#innerInventory").show();
			updateArmamento();
			updateMochila();
			}, 400);
		}
	});
	$('.send').droppable({
		hoverClass: 'hoverControl',
		drop: function (event, ui) {
			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined || origin === "invRight") return;
			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
			if (origin === "slotskeybind") return;

			if (itemData.key === undefined) return;

			$.post("http://elite_inventory/sendItem", JSON.stringify({
				item: itemData.key,
				slot: itemData.slot,
				amount: parseInt(parseInt($(".amount").val()))
			}));
			$("#circ").html("");

			$('.amount').val("");
		}
	});

	$(".populated").on("auxclick", e => {
        e.preventDefault();
        if (e.which === 1) {
            const item = e.target;
            const origin = $(item).parent()[0].className;
            if (origin === undefined || origin === "invRight") return;

            itemData = { key: $(item).data('item-key'), slot: $(item).data('slot') };

            if (itemData.key === undefined) return;
            var delay = true;
            let amount = 1;
            if (delay === true) {
                $.post("http://elite_inventory/useItem", JSON.stringify({
                    item: itemData.key,
                    slot: itemData.slot,
                    amount: amount
                }));
                $("#circ").html("");
                setTimeout(() => {
                    delay = false;
                }, 5000)
            }


        }
    });
}

/*
 ATUALIZANDO O INVENTÁRIO 
*/
const updateMochila = () => {
	$.post("http://elite_inventory/requestMochila", JSON.stringify({}), (data) => {
		// document.getElementById("banner-img").src = data.banner;
		document.getElementById("trocar-img").src = data.img;
		$("#nome-personagem").html(data.infos[0]);
		$("#passaporte-personagem").html(`[${data.infos[1]}]`);
		$("#banco").html(formatarNumero(data.infos[2]));
		$("#emprego").html(data.infos[3]);
		$("#celular").html(data.infos[4]);
		$("#registro").html(data.infos[5]);
		$("#idade").html(`${(data.infos[6])} anos`);
		$("#carteira").html(`${(formatarNumero(data.infos[7]))} $`);
		$("#vip1").html(data.infos[10]);
		$("#vip2").html(data.infos[11]);
		$("#vip3").html(data.infos[12]);
		$("#vip4").html(data.infos[13]);
		$("#vip5").html(data.infos[14]);
		$("#vip6").html(data.infos[15]);
		$("#vip7").html(data.infos[16]);
		$("#vip8").html(data.infos[17]);
		$("#multas").html(`${(data.infos[9])} $`);
		$(".peso-sobrando").html(`${(data.peso).toFixed(2)} / ${(data.maxpeso).toFixed(2)}`);
		// $(".peso-sobrando").html(`${(data.sobrapeso).toFixed(2)}kg sobrando`);
		var PesoCirculo = new ProgressBar.Line(circ, {
			strokeWidth: 1,
			easing: 'easeInOut',
			duration: 1400,
			color: '#ffffff',
			trailColor: '#8080802c',
			trailWidth: 1,
			svgStyle: {width: '100%', height: '100%'}

		});
		PesoCirculo.animate(1-data.sobrapeso.toFixed()/data.maxpeso.toFixed()); 
		weightLeft = data.peso;
		maxWeightLeft = data.maxpeso;


		$(".invLeft").html("");
		$(".invRight").html("");

		const nameList2 = data.drop.sort((a, b) => (a.name > b.name) ? 1 : -1);
		for (let x = 1; x <= mySlots ; x++) {
			const slot = x.toString();

			if (data.inventario[slot] !== undefined) {
				const v = data.inventario[slot];
				const item = `<div class="item populated" style="background-image: url('http://${IPend}/${pastaName}/${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-amount="${v.amount}" data-peso="${v.peso}" data-item-key="${v.key}" data-name-key="${v.name}" data-slot="${slot}">
					<div class="top">
					<div class="itemWeight"></div>
					<div class="itemAmount">${formatarNumero(v.amount)}x   |   ${(v.peso * v.amount).toFixed(2)}</div>
				</div>
					<div class="itemname">${v.name}</div>
				</div>`;

				$(".invLeft").append(item);
			} else {
				const item = `<div class="item empty" data-slot="${slot}"></div>`;
				$(".invLeft").append(item);
			}
		}

		for (let x = 1; x <= 3; x++) {
			const slot = x.toString();

			if (nameList2[x - 1] !== undefined) {
				const v = nameList2[x - 1];
				const item = `<div class="item populated" style="background-image: url('http://${IPend}/${pastaName}/${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-item-key="${v.key}" data-name-key="${v.name}" data-id="${v.id}" data-grid="${v.grid}" data-amount="${v.amount}" data-peso="${v.peso}" data-slot="${slot}">
					<div class="top">
						<div class="itemWeight"></div>
						<div class="itemAmount">${formatarNumero(v.amount)}x   |   ${(v.peso * v.amount).toFixed(2)}</div>
					</div>
					<div class="itemname">${v.name}</div>
				</div>`;

				$(".invRight").append(item);
			} else {
				const item = `<div class="item empty" data-slot="${slot}"></div>`;

				$(".invRight").append(item);
				// $(".invLefte").append(item);
			}
		}
		
		updateDrag();
	});
	
}
const updateArmamento = () => {
	$.post("http://elite_inventory/requestArmamento",JSON.stringify({}),(data) => {

		for (let x = 1; x <= 5; x++) {
			// const slot = x.toString();
			const nameArmadoList = data.armamento.sort((a,b) => (a.weapon > b.weapon) ? 1: -1);
			$('.armas').empty().append(`
			${nameArmadoList.map((item) => (`

			<div class="slotskeybind">
				<div class="item populated" style="background-image: url('http://${IPend}/${pastaName}/${item.index}.png'); background-position: center; background-repeat: no-repeat;" data-item-ammo="${item.ammo}" data-key="n${x}" data-item-drop="armamento" data-item-key="${item.key}" data-item-type="${item.type}" data-name-key="${item.weapon}">
					<div class="name-ammo" >${item.ammo}</div>
					<div class="name-armado">${item.weapon}</div>
				</div>
			 </div>
			`)).join('')}
			`);
		updateDrag();
		}
	});
}
const formatarNumero = n => {
	var n = n.toString();
	var r = '';
	var x = 0;

	for (var i = n.length; i > 0; i--) {
		r += n.substr(i - 1, 1) + (x == 2 && i != 1 ? '.' : '');
		x = x == 2 ? 0 : x + 1;
	}

	return r.split('').reverse().join('');
}
const pastaName = 'inventario'; /* Nome da pasta onde se está as imagens no XAMMP */
const IPend = '131.196.197.44' ; /* IP da VPS ond está hospedada as imagens */

const mySlots = 50;
const inSlots = 100;

var selectShop = "selectShop";
var selectCraft = "selectCraft";
var selectType = "Buy";
let shiftPressed = true;
let type = ""



$(document).ready(function () {
	window.addEventListener("message", function (event) {
		if (event.data.log) { type = event.data.log; }
		switch (event.data.action) {
			
			case "hideNUI":
				$(".inventory").css("display", "none")
			break;
			
			case "crafting":
				$(".crafting").css("display", "none")
			break;

			case "showMochila":
				updateMochila();
				$(".inventory").css("display", "flex")
			break;

			case "updateMochila":
				updateMochila();
			break;

			case "showInspect":
				updateInspect();
				$(".inventory").css("display", "flex")
			break;

			case "updateInspect":
				updateInspect();
			break;

			case "showChest":
				updateChest();
				$(".inventory").css("display","flex")
			break;
			
			case "updateChest":
				updateChest();
			break;

			case "requestCrafting":
				requestCrafting();
			break;

			case "showCrafting":
				selectCraft = event.data.name;
				
				$(".crafting").css("display", "flex")
				requestCrafting();
			break;

			case "showVault":
				updateVault();
				$(".inventory").css("display", "flex")
			break;

			case "updateVault":
				updateVault();
			break;

			case "showShops":
				selectShop = event.data.name;
				selectType = event.data.type;
				$(".inventory").css("display","flex")
				requestShop();
			break;

			case "requestShop":
				requestShop();
			break;

			case "showTrunk":
				updateTrunkChest();
				$(".inventory").css("display","flex")

			break;
			
			case "updateTrunk":
				updateTrunkChest();
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
			$.post("http://elite_inventorys/invClose", JSON.stringify({type : type}));
			type = "";
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

	$('.close').click(function() {
		$.post("http://elite_inventorys/invClose", JSON.stringify({}));
	});

	$('.empty').droppable({
		hoverClass: 'hoverControl',
		drop: function (event, ui) {
			if (ui.draggable.parent()[0] == undefined) return;

			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined) return;
			const tInv = $(this).parent()[0].className;

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
			}

			weightLeft = futureWeightLeft;
			updateDrag();

			if (origin === "invLeft" && tInv === "invLeft") {
				$.post("http://elite_inventorys/updateSlot", JSON.stringify({
					item: itemData.key,
					slot: itemData.slot,
					target: target,
					amount: parseInt($(".amount").val())
				}));
			} else if (origin === "invRight" && tInv === "invLeft") {
				const id = ui.draggable.data("id");
				const grid = ui.draggable.data("grid");				
				$.post("http://elite_inventorys/pickupItem", JSON.stringify({
					id: id,
					target: target,
					amount: parseInt($(".amount").val())
				}));
			} else if (origin === "invLeft" && tInv === "invRight") {
				$.post("http://elite_inventorys/dropItem", JSON.stringify({
					item: itemData.key,
					slot: itemData.slot,
					amount: parseInt($(".amount").val())
				}));
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
				$.post("http://elite_inventorys/updateSlot", JSON.stringify({
					item: itemData.key,
					slot: itemData.slot,
					target: target,
					amount: parseInt($(".amount").val())
				}));
			} else if (origin === "invRight" && tInv === "invLeft") {
				const id = ui.draggable.data("id");
				const grid = ui.draggable.data("grid");
				$.post("http://elite_inventorys/pickupItem", JSON.stringify({
					id: id,
					target: target,
					amount: parseInt($(".amount").val())
				}));
			} else if (origin === "invLeft" && tInv === "invRight") {
				$.post("http://elite_inventorys/dropItem", JSON.stringify({
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
			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined || origin === "invRight") return;
			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };

			if (itemData.key === undefined) return;

			$.post("http://elite_inventorys/useItem", JSON.stringify({
				item: itemData.key,
				slot: itemData.slot,
				amount: parseInt(parseInt($(".amount").val()))
			}));

			$('.amount').val("");
		}
	});

	$('.send').droppable({
		hoverClass: 'hoverControl',
		drop: function (event, ui) {
			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined || origin === "invRight") return;
			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };

			if (itemData.key === undefined) return;

			$.post("http://elite_inventorys/sendItem", JSON.stringify({
				item: itemData.key,
				slot: itemData.slot,
				amount: parseInt(parseInt($(".amount").val()))
			}));

			$('.amount').val("");
		}
	});

	$(".populated").on("auxclick", e => {
		e.preventDefault();
		if (e.which === 3) {
			const item = e.target;
			const origin = $(item).parent()[0].className;
			if (origin === undefined || origin === "invRight") return;

			itemData = { key: $(item).data('item-key'), slot: $(item).data('slot') };

			if (itemData.key === undefined) return;

			let amount = 1

			$.post("http://elite_inventorys/useItem", JSON.stringify({
				item: itemData.key,
				slot: itemData.slot,
				amount: amount
			}));
		}
	});
}

const updateTrunkChest = () => {
	$.post("http://elite_inventorys/requestTrunkChest",JSON.stringify({}),(data) => {
		$(".myInfos").html(`
			<b>${data.infos[0]} <i>#${data.infos[1]}</i></b>
			<div class="infosContent">
				<span>${(data.peso).toFixed(2)} / ${(data.maxpeso).toFixed(2)}</span>
				<span>${(data.peso2).toFixed(2)} / ${(data.maxpeso2).toFixed(2)}</span>
			</div>
		`);

		const nameList2 = data.inventario2.sort((a,b) => (a.name > b.name) ? 1: -1);

		$(".invLeft").html("");
		$(".invRight").html("");

		for (let x=1; x <= mySlots; x++) {
			const slot = x.toString();

			if (data.inventario[slot] !== undefined) {
				const v = data.inventario[slot];
				const item = `<div class="item populated" style="background-image: url('http://${IPend}/${pastaName}/${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-item-key="${v.key}" data-name-key="${v.name}" data-amount="${v.amount}" data-slot="${slot}">
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

		for (let x=1; x <= inSlots; x++) {
			const slot = x.toString();

			if (nameList2[x-1] !== undefined) {
				const v = nameList2[x-1];
				const item = `<div class="item populated" style="background-image: url('http://${IPend}/${pastaName}/${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-item-key="${v.key}" data-name-key="${v.name}" data-amount="${v.amount}" data-slot="${slot}">
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
			}
		}
		updateDragTrunk()
	});
}
const updateDragTrunk = () => {
	$('.populated').draggable({
		helper: 'clone'
	});

	$('.empty').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined) return;
			const tInv = $(this).parent()[0].className;

			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
			const target = $(this).data('slot');

			if (itemData.key === undefined || target === undefined) return;

			let amount = $(".amount").val();
			if (shiftPressed) amount = ui.draggable.data('amount');

			if (tInv === "invLeft") {
				if (origin === "invLeft") {
					$.post("http://elite_inventorys/populateTrunk",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt(parseInt($(".amount").val()))
					}))

					$('.amount').val("");
				} else if (origin === "invRight") {
					$.post("http://elite_inventorys/takeTrunk",JSON.stringify({
						item: itemData.key,
						slot: target,
						amount: parseInt(parseInt($(".amount").val()))
					}));

					$('.amount').val("");
				}
			} else if ( tInv === "invRight" ) {
				if ( origin === "invLeft" ) {
					$.post("http://elite_inventorys/TrunkStore",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						amount: parseInt(parseInt($(".amount").val()))
					}));

					$('.amount').val("");
				}
			}
		}
	});

	$('.populated').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined) return;
			const tInv = $(this).parent()[0].className;
			
			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
			const target = $(this).data('slot');

			if (itemData.key === undefined || target === undefined) return;

			let amount = $(".amount").val();
			if (shiftPressed) amount = ui.draggable.data('amount');


			if ( tInv === "invLeft" ) {
				if (origin === "invLeft"){
					$.post("http://elite_inventorys/populateTrunk",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt(parseInt($(".amount").val()))
					}));

					$('.amount').val("");
				} else if (origin === "invRight"){
					$.post("http://elite_inventorys/sumSlotTrunk",JSON.stringify({
						item: itemData.key,
						slot: target,
						amount: parseInt(parseInt($(".amount").val()))
					}));

					$('.amount').val("");
				}
			} else if ( tInv === "invRight" ) {
				if ( origin === "invLeft" ) {
					$.post("http://elite_inventorys/TrunkStore",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						amount: parseInt(parseInt($(".amount").val()))
					}));

					$('.amount').val("");
				}
			}
		}
	});
}


const updateInspect = () => {
	$.post("http://elite_inventorys/requestInspect",JSON.stringify({}),(data) => {
		$(".myInfos").html(`
			<b>${data.infos[0]} <i>#${data.infos[1]}</i></b>
			<div class="infosContent">
				<span>${(data.peso).toFixed(2)} / ${(data.maxpeso).toFixed(2)}</span>
			</div>
		`);

		$(".invLeft").html("");
		$(".invRight").html("");

		for (let x=1; x <= mySlots; x++){
			const slot = x.toString();

			if (data.inventario[slot] !== undefined){
				const v = data.inventario[slot];
				const item = `<div class="item populated" style="background-image: url('http://${IPend}/${pastaName}/${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-item-key="${v.key}" data-name-key="${v.name}" data-amount="${v.amount}" data-slot="${slot}">
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

		for (let x=1; x <= inSlots; x++){
			const slot = x.toString();

			if (data.inventario2[slot] !== undefined) {
				const v = data.inventario2[slot];
				const item = `<div class="item populated" style="background-image: url('http://${IPend}/${pastaName}/${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-item-key="${v.key}" data-name-key="${v.name}" data-amount="${v.amount}" data-slot="${slot}">
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
			}
		}
		updateDragInspect();
	});
}
const updateDragInspect = () => {
	$('.populated').draggable({
		helper: 'clone'
	});

	$('.empty').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined) return;
			const tInv = $(this).parent()[0].className;

			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
			const target = $(this).data('slot');

			if (itemData.key === undefined || target === undefined) return;

			let amount = $(".amount").val();
			if (shiftPressed) amount = ui.draggable.data('amount');

			if (tInv === "invLeft") {
				if (origin === "invLeft") {
					$.post("http://elite_inventorys/populateInspect",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt(parseInt($(".amount").val()))
					}))

					$('.amount').val("");
				} else if (origin === "invRight") {
					$.post("http://elite_inventorys/takeInspect",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt(parseInt($(".amount").val()))
					}));

					$('.amount').val("");
				}
			} else if ( tInv === "invRight" ) {
				if ( origin === "invRight" ) {
					$.post("http://elite_inventorys/populateSlot2",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt(parseInt($(".amount").val()))
					}))

					$('.amount').val("");
				} else if ( origin === "invLeft" ) {
					$.post("http://elite_inventorys/storeInspect",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt(parseInt($(".amount").val()))
					}));

					$('.amount').val("");
				}
			}
		}
	});

	$('.populated').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined) return;
			const tInv = $(this).parent()[0].className;
			
			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
			const target = $(this).data('slot');

			if (itemData.key === undefined || target === undefined) return;

			let amount = $(".amount").val();
			if (shiftPressed) amount = ui.draggable.data('amount');


			if ( tInv === "invLeft" ) {
				if (origin === "invLeft"){
					$.post("http://elite_inventorys/updateInspect",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt(parseInt($(".amount").val()))
					}));

					$('.amount').val("");
				} else if (origin === "invRight"){
					$.post("http://elite_inventorys/sumInspect",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt(parseInt($(".amount").val()))
					}));

					$('.amount').val("");
				}
			} else if ( tInv === "invRight" ) {
				if ( origin === "invRight" ) {
					$.post("http://elite_inventorys/updateSlot2",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt(parseInt($(".amount").val()))
					}));

					$('.amount').val("");
				} else if ( origin === "invLeft" ) {
					$.post("http://elite_inventorys/sum2Inspect",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt(parseInt($(".amount").val()))
					}));

					$('.amount').val("");
				}
			}
		}
	});
}
/*
 ATUALIZANDO O INVENTÁRIO 
*/
const updateMochila = () => {
	$.post("http://elite_inventorys/requestMochila", JSON.stringify({}), (data) => {
		$(".myInfos").html(`
			<b>${data.infos[0]} <i>#${data.infos[1]}</i></b>
			<div class="infosContent">
				<span>${(data.peso).toFixed(2)} / ${(data.maxpeso).toFixed(2)}</span>
			</div>
		`);


		weightLeft = data.peso;
		maxWeightLeft = data.maxpeso;


		$(".invLeft").html("");
		$(".invRight").html("");

		const nameList2 = data.drop.sort((a, b) => (a.name > b.name) ? 1 : -1);

		for (let x = 1; x <= 100; x++) {
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

		for (let x = 1; x <= 100; x++) {
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
			}
		}
		updateDrag();
	});
}
/* 
	CHESTTTT
*/
const updateChest = () => {
	$.post("http://elite_inventorys/requestChest",JSON.stringify({}),(data) => {
		$(".myInfos").html(`
			<b>${data.infos[0]} <i>#${data.infos[1]}</i></b>
			<div class="infosContent">
				<span>${(data.peso).toFixed(2)} / ${(data.maxpeso).toFixed(2)}</span>
				<span>${(data.peso2).toFixed(2)} / ${(data.maxpeso2).toFixed(2)}</span>
			</div>
		`);

		const nameList2 = data.inventario2.sort((a,b) => (a.name > b.name) ? 1: -1);

		$(".invLeft").html("");
		$(".invRight").html("");

		for (let x=1; x <= mySlots; x++) {
			const slot = x.toString();

			if (data.inventario[slot] !== undefined) {
				const v = data.inventario[slot];
				const item = `<div class="item populated" style="background-image: url('http://${IPend}/${pastaName}/${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-item-key="${v.key}" data-name-key="${v.name}" data-amount="${v.amount}" data-slot="${slot}">
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

		for (let x=1; x <= inSlots; x++) {
			const slot = x.toString();

			if (nameList2[x-1] !== undefined) {
				const v = nameList2[x-1];
				const item = `<div class="item populated" style="background-image: url('http://${IPend}/${pastaName}/${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-item-key="${v.key}" data-name-key="${v.name}" data-amount="${v.amount}" data-slot="${slot}">
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
			}
		}
		updateDragChest();
	});
}

const updateDragChest = () => {
	$('.populated').draggable({
		helper: 'clone'
	});

	$('.empty').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined) return;
			const tInv = $(this).parent()[0].className;

			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
			const target = $(this).data('slot');

			if (itemData.key === undefined || target === undefined) return;

			let amount = $(".amount").val();
			if (shiftPressed) amount = ui.draggable.data('amount');

			if (tInv === "invLeft") {
				if (origin === "invLeft") {
					$.post("http://elite_inventorys/populateChest",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt(parseInt($(".amount").val()))
					}))

					$('.amount').val("");
				} else if (origin === "invRight") {
					$.post("http://elite_inventorys/takeChest",JSON.stringify({
						item: itemData.key,
						slot: target,
						amount: parseInt(parseInt($(".amount").val()))
					}));

					$('.amount').val("");
				}
			} else if ( tInv === "invRight" ) {
				if ( origin === "invLeft" ) {
					$.post("http://elite_inventorys/storeChest",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						amount: parseInt(parseInt($(".amount").val()))
					}));

					$('.amount').val("");
				}
			}
		}
	});

	$('.populated').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined) return;
			const tInv = $(this).parent()[0].className;
			
			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
			const target = $(this).data('slot');

			if (itemData.key === undefined || target === undefined) return;

			let amount = $(".amount").val();
			if (shiftPressed) amount = ui.draggable.data('amount');


			if ( tInv === "invLeft" ) {
				if (origin === "invLeft"){
					$.post("http://elite_inventorys/updateChest",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt(parseInt($(".amount").val()))
					}));

					$('.amount').val("");
				} else if (origin === "invRight"){
					$.post("http://elite_inventorys/sumChest",JSON.stringify({
						item: itemData.key,
						slot: target,
						amount: parseInt(parseInt($(".amount").val()))
					}));

					$('.amount').val("");
				}
			} else if ( tInv === "invRight" ) {
				if ( origin === "invLeft" ) {
					$.post("http://elite_inventorys/storeChest",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						amount: parseInt(parseInt($(".amount").val()))
					}));

					$('.amount').val("");
				}
			}
		}
	});
}
/*
	RESPONSÁVEL DO CRAFTINGGGG
*/
const requestCrafting = () => {
	const mySlots = 50;
	const inSlots = 40;

	$.post("http://elite_inventorys/requestCrafting", JSON.stringify({ craft: selectCraft }), (data) => {
		$(".myInfos").html(`
		<b>${data.infos[0]} <i>#${data.infos[1]}</i></b>
		<div class="infosContent">
				<span><s>PESO:</s> ${(data.weight).toFixed(2)} / ${(data.maxweight).toFixed(2)}</span>
			</div>
		`);

		const nameList2 = data.inventoryCraft.sort((a, b) => (a.name > b.name) ? 1 : -1);

		$(".invLeft").html("");
		$(".invRight").html("");


		for (let x = 1; x <= mySlots; x++) {
			const slot = x.toString();

			if (data.inventoryUser[slot] !== undefined) {
				const v = data.inventoryUser[slot];
				const item = `<div class="item populated" style="background-image: url('http://${IPend}/${pastaName}/${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-item-key="${v.key}" data-name-key="${v.name}" data-amount="${v.amount}" data-slot="${slot}">
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

		for (let x = 1; x <= inSlots; x++) {
			const slot = x.toString();

			if (nameList2[x - 1] !== undefined) {
				const v = nameList2[x - 1];
				let list = "";

				for (let i in v.list) {
					list = `${list} ${v.list[i].amount}x ${v.list[i].name},`
				}

				list = list.substring(0, list.length - 1);

				const item = `<div class="item populated" style="background-image: url('http://${IPend}/${pastaName}/${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-item-key="${v.key}" data-name-key="${v.name}" data-item-list="${list}" data-slot="${slot}">
				<div class="top">
					<div class="itemWeight">${v.weight.toFixed(2)}</div>
				</div>

				<div class="itemname">${v.name}</div>
				</div>`;

				$(".invRight").append(item);
			} else {
				const item = `<div class="item empty" data-slot="${slot}"></div>`;

				$(".invRight").append(item);
			}
		}
		updateDragCrafting();
	});
}
const updateDragCrafting = () => {
	$('.populated').draggable({
		helper: 'clone'
	});

	$('.empty').droppable({
		hoverClass: 'hoverControl',	
		drop: function (event, ui) {
			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined) return;

			const tInv = $(this).parent()[0].className;
			if (tInv === "invLeft") {

				if (origin === "invLeft") {
					itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
					const target = $(this).data('slot');

					if (itemData.key === undefined || target === undefined) return;

					$.post("http://elite_inventorys/populateCrafting", JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				} else if (origin === "invRight") {
					itemData = { key: ui.draggable.data('item-key') };
					const target = $(this).data('slot');

					if (itemData.key === undefined || target === undefined) return;

					$.post("http://elite_inventorys/functionCraft", JSON.stringify({
						craft: selectCraft,
						index: itemData.key,
						slot: target,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				}
			} else if (tInv === "invRight") {
				if (origin === "invLeft") {
					itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') }

					if (itemData.key === undefined) return;

					$.post("http://elite_inventorys/functionDestroy", JSON.stringify({
						craft: selectCraft,
						index: itemData.key,
						slot: itemData.slot,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				}
			}
		}
	});

	$('.populated').droppable({
		hoverClass: 'hoverControl',
		drop: function (event, ui) {
			const origin = ui.draggable.parent()[0].id;
			if (origin === undefined) return;

			const tInv = $(this).parent()[0].id;

			if (tInv === "invLeft") {
				if (origin === "invLeft") {
					itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
					const target = $(this).data('slot');

					if (itemData.key === undefined || target === undefined) return;

					$.post("http://elite_inventorys/updateCrafting", JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				} else if (origin === "invRight") {
					itemData = { key: ui.draggable.data('item-key') };
					const target = $(this).data('slot');

					if (itemData.key === undefined || target === undefined || itemData.key !== $(this).data('item-key')) return;

					$.post("http://elite_inventorys/functionCraft", JSON.stringify({
						craft: selectCraft,
						index: itemData.key,
						slot: target,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				}
			} else if (tInv === "invRight") {
				if (origin === "invLeft") {
					itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') }

					if (itemData.key === undefined) return;

					$.post("http://elite_inventorys/functionDestroy", JSON.stringify({
						craft: selectCraft,
						index: itemData.key,
						slot: itemData.slot,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				}
			}
		}
	});

	$(".populated").hover(function () {
		const data = $(this).data("item-list");

		if (data === undefined) return;

		$(".recipe").hide().text(data).fadeIn();
	}, function () {
		$(".recipe").hide();
	});
}
/*
 REQUISIÇÃO DOS BAUS
*/
const updateVault = () => {
	const mySlots = 50;
	const inSlots = 100;

	$.post("http://elite_inventorys/requestVault",JSON.stringify({}),(data) => {
		$(".myInfos").html(`
			<b>${data.infos[0]} <i>#${data.infos[1]}</i></b>
			<div class="myInfosContent">
				<span><s>PESO:</s> ${(data.peso).toFixed(2)} / ${(data.maxpeso).toFixed(2)}</span>
				<span><s>BAÚ:</s> ${(data.peso2).toFixed(2)} / ${(data.maxpeso2).toFixed(2)}</span>
			</div>
		`);

		$(".invweight").html(`
			<div id="myWeight">
				<div id="myWeightContent" style="width: ${parseInt(data.peso/data.maxpeso*100)}%"></div>
			</div>
			<div id="chestWeight">
				<div id="chestWeightContent" style="width: ${parseInt(data.peso2/data.maxpeso2*100)}%"></div>
			</div>
		`);

		const nameList2 = data.inventario2.sort((a,b) => (a.name > b.name) ? 1: -1);

		$(".invLeft").html("");
		$(".invRight").html("");

		for (let x=1; x <= mySlots; x++) {
			const slot = x.toString();

			if (data.inventario[slot] !== undefined) {
				const v = data.inventario[slot];
				const item = `<div class="item populated" style="background-image: url('http://${IPend}/${pastaName}/${v.index}.png'); background-size: 120px; background-position: center; background-repeat: no-repeat;" data-item-key="${v.key}" data-name-key="${v.name}" data-slot="${slot}">
				<div class='top'>	
					<div class="itemWeight"></div>
					<div class="itemAmount">${formatarNumero(v.amount)}x   |   ${(v.peso * v.amount).toFixed(2)}</div>
				</div>
				<div class="itemname">${v.name}</div>
					${v.durability !== undefined ? `<div id="durability"><div id="durability2" style="width: ${v.durability*10}%"></div></div>`:`<div id="nonebility"></div>`}
				</div>`;

				$(".invLeft").append(item);
			} else {
				const item = `<div class="item empty" data-slot="${slot}"></div>`;

				$(".invLeft").append(item);
			}
		}

		for (let x=1; x <= inSlots; x++) {
			const slot = x.toString();

			if (nameList2[x-1] !== undefined) {
				const v = nameList2[x-1];
				const item = `<div class="item populated" style="background-image: url('http://${IPend}/${pastaName}/${v.index}.png'); background-size: 120px; background-position: center; background-repeat: no-repeat;" data-item-key="${v.key}" data-name-key="${v.name}" data-slot="${slot}">
				<div class='top'>	
					<div class="itemWeight"></div>
					<div class="itemAmount">${formatarNumero(v.amount)}x   |   ${(v.peso * v.amount).toFixed(2)}</div>
				</div>
				<div class="itemname">${v.name}</div>

					${v.durability !== undefined ? `<div id="durability"><div id="durability2" style="width: ${v.durability*10}%"></div></div>`:`<div id="nonebility"></div>`}
				</div>`;

				$(".invRight").append(item);
			} else {
				const item = `<div class="item2 empty" data-slot="${slot}"></div>`;

				$(".invRight").append(item);
			}
		}
		updateDragVault();
	});
}
const updateDragVault = () => {
	$('.populated').draggable({
		helper: 'clone'
	});

	$('.empty').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined) return;

			const tInv = $(this).parent()[0].className;

			if ( tInv === "invLeft" ) {
				if ( origin === "invLeft" ) {
					itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
					const target = $(this).data('slot');

					if (itemData.key === undefined || target === undefined) return;

					$.post("http://elite_inventorys/populateHome",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				} else if ( origin === "invRight" ) {
					itemData = { key: ui.draggable.data('item-key') };
					const target = $(this).data('slot');

					if (itemData.key === undefined || target === undefined) return;

					$.post("http://elite_inventorys/takeHome",JSON.stringify({
						item: itemData.key,
						slot: target,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				}
			} else if ( tInv === "invRight" ) {
				if ( origin === "invLeft" ) {
					itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };

					if (itemData.key === undefined) return;

					$.post("http://elite_inventorys/storeHome",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				}
			}
		}
	});

	$('.populated').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined) return;

			const tInv = $(this).parent()[0].className;

			if ( tInv === "invLeft" ) {
				if ( origin === "invLeft" ) {
					itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
					const target = $(this).data('slot');

					if (itemData.key === undefined || target === undefined) return;

					$.post("http://elite_inventorys/updateHome",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				} else if (origin === "invRight") {
					itemData = { key: ui.draggable.data('item-key') };
					const target = $(this).data('slot');

					if (itemData.key === undefined || target === undefined) return;

					$.post("http://elite_inventorys/sumHome",JSON.stringify({
						item: itemData.key,
						slot: target,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				}
			} else if ( tInv === "invRight" ) {
				if ( origin === "invLeft" ) {
					itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };

					if (itemData.key === undefined) return;

					$.post("http://elite_inventorys/storeHome",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				}
			}
		}
	});
}
/* -------------------------------
	REQUISIÇÃO DOS SHOPS

-------------------- */
const requestShop = () => {
	$.post("http://elite_inventorys/requestShop",JSON.stringify({ shop: selectShop }),(data) => {
		$(".myInfos").html(`
			<b>${data.infos[0]} <i>#${data.infos[1]}</i></b>
			<div class="infosContent">
				<span><s>PESO:</s> ${(data.weight).toFixed(2)} / ${(data.maxweight).toFixed(2)}</span>
			</div>
		`);

		const nameList2 = data.inventoryShop.sort((a,b) => (a.name > b.name) ? 1: -1);

		$(".invLeft").html("");
		$(".invRight").html("");

		for (let x=1; x <= mySlots; x++) {
			const slot = x.toString();

			if (data.inventoryUser[slot] !== undefined) {
				const v = data.inventoryUser[slot];
				const item = `<div class="item populated" style="background-image: url('http://${IPend}/${pastaName}/${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-item-key="${v.key}" data-name-key="${v.name}" data-amount="${v.amount}" data-slot="${slot}">
					<div class="top">
						<div class="itemWeight">${(v.peso*v.amount).toFixed(2)}</div>
						<div class="itemAmount">${formatarNumero(v.amount)}x</div>
					</div>
					<div class="itemname">${v.name}</div>
				</div>`;

				$(".invLeft").append(item);
			} else {
				const item = `<div class="item empty" data-slot="${slot}"></div>`;

				$(".invLeft").append(item);
			}
		}

		for (let x=1; x <= mySlots; x++) {
			const slot = x.toString();

			if (nameList2[x-1] !== undefined) {
				const v = nameList2[x-1];
				const item = `<div class="item populated" style="background-image: url('http://${IPend}/${pastaName}/${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-item-key="${v.key}" data-name-key="${v.name}" data-amount="${v.amount}" data-slot="${slot}">
					<div class="top">
						<div class="itemWeight">${(v.weight).toFixed(2)}</div>
						<div class="itemAmount">$${formatarNumero(v.price)}</div>
					</div>
					<div class="itemname">${v.name}</div>
				</div>`;

				$(".invRight").append(item);
			} else {
				const item = `<div class="item empty" data-slot="${slot}"></div>`;

				$(".invRight").append(item);
			}
		}
		updateDragShops();
	});
}

const updateDragShops = () => {
	$('.populated').draggable({
		helper: 'clone'
	});

	$('.empty').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined) return;
			const tInv = $(this).parent()[0].className;

			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
			const target = $(this).data('slot');

			if (itemData.key === undefined || target === undefined) return;

			let amount = parseInt($(".amount").val());
			if (shiftPressed) amount = ui.draggable.data('amount');

			if (tInv === "invLeft"){
				if (origin === "invLeft"){
					$.post("http://elite_inventorys/populateShops",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("");
				} else if (origin === "invRight"){
					$.post("http://elite_inventorys/functionShops",JSON.stringify({
						shop: selectShop,
						item: itemData.key,
						slot: target,
						amount: parseInt($(".amount").val())
					}));

					$('.amount').val("");
				}
			} else if (tInv === "invRight"){
				if (origin === "invLeft" && selectType === "Sell"){
					$.post("http://elite_inventorys/functionShops",JSON.stringify({
						shop: selectShop,
						item: itemData.key,
						slot: itemData.slot,
						amount: parseInt($(".amount").val())
					}));

					$('.amount').val("");
				}
			}
		}
	});
	
	$('.populated').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined) return;
			const tInv = $(this).parent()[0].className;
			
			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
			const target = $(this).data('slot');

			if (itemData.key === undefined || target === undefined) return;

			let amount = parseInt($(".amount").val());
			if (shiftPressed) amount = ui.draggable.data('amount');


			if (tInv === "invLeft" ){
				if (origin === "invLeft"){
					$.post("http://elite_inventorys/updateShops",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt($(".amount").val())
					}));

					$('.amount').val("");
				} else if (origin === "invRight"){
					$.post("http://elite_inventorys/functionShops",JSON.stringify({
						shop: selectShop,
						item: itemData.key,
						slot: target,
						amount: parseInt($(".amount").val())
					}));

					$('.amount').val("");
				}
			} else if (tInv === "invRight"){
				if (origin === "invLeft" && selectType === "Sell"){
					$.post("http://elite_inventorys/functionShops",JSON.stringify({
						shop: selectShop,
						item: itemData.key,
						slot: itemData.slot,
						amount: parseInt($(".amount").val())
					}));

					$('.amount').val("");
				}
			}
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
const perLitrePrice = 7.8;

$(document).ready(function () {
	$("#litre-price").text("" + perLitrePrice.toFixed(2));

	window.addEventListener("message", function (event) {
		if (event.data.action == true) {
			fuel = event.data.fuel;
			datafuel = event.data.fuel;
			
			$('.model').attr('src',`http://131.196.197.44/vrp_vehicles/${event.data.vehicle}.png`/*`/html/images/${event.data.vehicle}.png*/)
			$("body").css("display", "flex");
			$(".modal").css("display", "none");
			$(".litro").text(Math.round(event.data.fuel) + "%");
			$("#amount").val("");

			$(document).keyup(function (e) {
				if (!counting) {
					if (e.key === "Escape") {
						myStop();
						$("#amount").val("");
						counting;
						inv;
						price;
						perc_new;
						totalPercent;
						guardar;
						completar;
						maxFuel;
						$.post("http://elite_fuel/escape", JSON.stringify({}));
					}
				}
			});
		} else {
			$("body").fadeOut();
		}
	});

	var counting;
	var completar;
	var guardar;
	var price;
	var inv;
	var totalPercent;
	var perc_new;
	var maxFuel;

	function myStart() {
		if (inv == undefined) {
			inv = setInterval(increase, 500);
		}
	}

	function myStop() {
		if (inv !== undefined) {
			clearInterval(inv);
			inv = undefined;
		}
	}

	function increase() {
		if (counting) {
			if (fuel < maxFuel) {
				fuel++;
				totalPercent = Math.round(fuel) + "%";
				$(".litro").text(totalPercent);
				$.post("http://elite_fuel/increase", JSON.stringify({ percent: fuel }));

				$(".litro").toggleClass("bouncing", true);

			} else {
				$.post("http://elite_fuel/removeanim", JSON.stringify({}));
				if (completar) {
					$.post("http://elite_fuel/pay", JSON.stringify({ new_perc: perc_new }));
					perc_new;
					completar = !completar;
				} else if (guardar) {
					$.post("http://elite_fuel/pay", JSON.stringify({ new_perc: price }));
					price;
					guardar = !guardar;
				}
				counting = !counting;
				inv;
				totalPercent;
				maxFuel;
				myStop();
				$.post("http://elite_fuel/escape", JSON.stringify({}));

				$(".litro").toggleClass("bouncing", false);
			}
		}
	}

	$("#retirar").click(function () {
		if (!counting) {
			perc_new = (100 * perLitrePrice) - Math.round(datafuel * perLitrePrice);
			$.post("http://elite_fuel/checkpay", JSON.stringify({ new_perc: perc_new }), (data) => {
				if (!data.hasMoney)
					return;
				
				counting = !counting;
				completar = !completar;
				maxFuel = 99;
				$(".modal span").text("Deseja abastecer o tanque no valor de R$" + perc_new);
				$(".modal").fadeIn(300);
				$(".container").fadeOut();
				$("left").fadeOut();
				$(".act").fadeOut();
			});
		}
	});

	$("#guardar").click(function () {
		if (!counting) {
			price = Math.round($("#amount").val() * perLitrePrice);
			if (price > 0 && Math.round(price / perLitrePrice) <= Math.round(100 - datafuel)) {
				if (100 + Math.round(datafuel) <= 100 * perLitrePrice) {
					$.post("http://elite_fuel/checkpay", JSON.stringify({ new_perc: price }), (data) => {
						if (!data.hasMoney)
							return;

						counting = !counting;
						guardar = !guardar;
						maxFuel = datafuel + Math.round($("#amount").val());


						$(".modal span").text("Deseja abastecer o tanque no valor de R$ "+ price);
						$(".modal").fadeIn(300);
						$(".container").fadeOut();
						$("left").fadeOut();
						$(".act").fadeOut();
					});
				} else {
					var texto = "O gasto máximo para encher o tanque é de <b>$" + ((100 * perLitrePrice) - Math.round(datafuel)) + "</b>!";
					$.post("http://elite_fuel/notifytext", JSON.stringify({ text: texto }));
				}
			} else {
				var texto = "Somente valores entre <b>$1</b> e <b>$" + ((100 - datafuel) * perLitrePrice) + "</b>, o valor atual é <b>$" + Math.round($("#amount").val() * perLitrePrice) + "</b>!";
				$.post("http://elite_fuel/notifytext", JSON.stringify({ text: texto }));
			}
		}
	});

	$("#plus").click(function () {
		if (!counting) {
			if (Math.round($("#amount").val()) < 100) {
				$("#amount").val(Math.round($("#amount").val()) + 1);
				price = $("#amount").val() * perLitrePrice;
			}
		}
	});

	$("#minus").click(function () {
		if (!counting) {
			if (Math.round($("#amount").val()) > 0) {
				$("#amount").val(Math.round($("#amount").val()) - 1);
				price = $("#amount").val() * perLitrePrice;
			}
		}
	});

	$(".accept").click(function () {
		if (counting) {
			$(".modal").fadeOut();
			$(".container").fadeIn(300);
			$("left").fadeIn(300);
			$(".act").fadeIn(300);
			$.post("http://elite_fuel/startanim", JSON.stringify({}));
			myStop();
			myStart();
		}
	});

	$(".recuse").click(function () {
		$(".modal").fadeOut();
		$(".container").fadeIn(300);
		$("left").fadeIn(300);
		$(".act").fadeIn(300);
		if (completar) {
			counting = !counting;
			completar = !completar;
		} else if (guardar) {
			counting = !counting;
			guardar = !guardar;
		}
	});
});

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Menu Default'

version '1.2'

client_scripts {
	'client/main.lua'
}

ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/css/app.css',
	'html/js/mustache.min.js',
	'html/js/app.js',
	'html/fonts/pdown.ttf',
	'html/fonts/bankgothic.ttf',
	'html/fonts/Carlito-Regular.ttf',
    'html/fonts/v.ttf',
	'html/img/cursor.png',
	'html/img/keys/enter.png',
	'html/img/keys/return.png',
	'html/img/header/*.png',
	'html/img/header/*.jpg',
	--[['html/img/header/247.png',
	'html/img/header/tatoo.png',
	'html/img/header/Inventaire.jpg',
	'html/img/header/Accessoires.png',
	'html/img/header/ammunation.jpg',
	'html/img/header/animations.jpg',
	'html/img/header/armesillegales.jpg',
	'html/img/header/autoecole.png',
	'html/img/header/Concessionnaire.jpg',
	'html/img/header/Entreprise.png',
	'html/img/header/cle.png',
	'html/img/header/factures.jpg',
	'html/img/header/gestionpatron.png',
	'html/img/header/gpsrapide.jpg',
	'html/img/header/illegal.png',
	'html/img/header/masques.png',
	'html/img/header/Me_concernant.jpg',
	'html/img/header/mecano.png',
	'html/img/header/bugershot.png',
	'html/img/header/sheriff.png',
	'html/img/header/police.png',
	'html/img/header/parachute.png',
	'html/img/header/preference.png',
	'html/img/header/beekers.png',
	'html/img/header/lscustom.png',
	'html/img/header/velo.png',
	'html/img/header/vestiairelspd.png',
	'html/img/header/menu.jpg',
	'html/img/header/poleemploi.png',
	'html/img/header/magvetement.png',
	'html/img/header/valider.png',
	'html/img/header/burgershot.png',
	'html/img/header/vetements.png',
	'html/img/header/vehicle.png',
	'html/img/header/mechanic.png',
	'html/img/header/vestiaire.jpg',
	'html/img/header/coiffeur.png',
	'html/img/header/gouvernement.png',
	'html/img/header/ems.png',
	'html/img/header/simmons.png',
	'html/img/header/animal.png',
	'html/img/header/bacars.png',
	'html/img/header/vigneron.png',
	'html/img/header/journalist.png',
	'html/img/header/tattoo.png',
	'html/img/header/thepalace.png',
	'html/img/header/malborose.png',
	'html/img/header/daymson.png',
	'html/img/header/bikershop.png',
	'html/img/header/armurielspd.png',
	'html/img/header/taxi.png',
	'html/img/header/leader.png',
	'html/img/header/autoshop.png',
	'html/img/header/unicorn.png',
	'html/img/header/immo.png',
	'html/img/header/avocat.png',
	'html/img/header/gardien.png',
	'html/img/header/personnaliser.png',
	'html/img/header/poisson.png',
	'html/img/header/rally.png',
	'html/img/header/garage.png',
	'html/img/header/fourriere.png',
	'html/img/header/coffre.png',
	'html/img/header/identite.png']]--
}

dependencies {
	'es_extended'
}
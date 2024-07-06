local Translations = {
    error = {
	nopet = 'Nincs házikedvenced!',
	nofood = 'Nincs nálad olyan élelem, amit a kiskedvenced megehetne..',
	nomoney = 'Nincs elég pénzed, hogy örökbe fogadhass egy kiskedvencet!',
	petdead = 'Kiskedvencedet elpusztult!',
	notretrieve = 'Kiskedvenced nem hívható vissza!',
	brokeanim = 'Megtörted az animációt, áthelyezés...',
    },
    success = {
	petsold = 'Házikedvencedet befogadta a menhely!',
	swappet = 'Lecserélted a házikedvencedet! Kérlek vigyázz rá! 🐶',
	buypet = 'Örökbefogadtál egy kiskedvencet! Kérlek vigyázz rá! 🐶',
	pethealed = 'Kiskedvencedet meggyógyult!',
    },
    primary = {
	shop = 'Nyomd meg az [E] gombot a kiskedvenc menhely megtekintéséhez!',
	sellpet = 'Kiskedvenc örökbeadása',
    },
    info = {
	releasepet = 'Elengedted a kiskedvencedet!',
	petaway = 'Kiskedvencedet visszaküldted a keneljébe!',
	hungry = 'Éhes a kisállatod!',
	petspawned = 'Kiskedvenced megérkezett!',
	petalreadyhere = 'Kiskedvenced már itt van veled! Keresd meg!',
	petspawning = 'Kiskedvencednek időre van szüksége, hogy hozzád találjon.. Idő: %{recentlySpawned}!',
	petfeed = 'Háziállatod ekkor lesz éhes: %{timeLeft}',
	retrieve = 'Kiskedvenced készen áll a visszahívásra..',
	petprogress = 'Út a kiskedvenced felnötté válásáig %{xpp} / %{cfg}...🐶',
    close_1 = 'Kisállat menhely zárva tart...',
    close_2 = 'Gyere vissza ',
    close_3 = '-kor',
    },
	label = {
	petshop = 'Kisállat menhely',
	petshop_2 = 'Kisállat bolt',
	petshop_3 = 'Kisállat örökbeadása',
	},
}

Lang = Lang or Locale:new({
    phrases = Translations,
    --warnOnMissing = true
})

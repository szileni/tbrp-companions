local Translations = {
    error = {
	nopet = 'Nincs házikedvenced!',
	nofood = 'Nincs nálad olyan élelem, amit a kiskedvenced megehetne..',
	nomoney = 'Nincs elég pénzed, hogy örökbe fogadhass egy kiskedvencet!',
	petdead = 'Kiskedvencedet elpusztult!',
	notretrieve = 'Kiskedvenced nem hívható vissza!',
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
    },
	label = {
	petshop = 'Kisállat menhely',
	},
}

Lang = Lang or Locale:new({
    phrases = Translations,
    --warnOnMissing = true
})

local Translations = {
    error = {
	nopet = 'You dont have a pet',
	nofood = 'You dont have any food that your little friend can eat...',
	nomoney = 'You dont have enough money to adopt a pet!',
	petdead = 'Your pet has died!',
	notretrieve = 'Your pet cannot be called back!',
	brokeanim = 'You broke the animation, Relocate',
    },
    success = {
	petsold = 'Your pet has been adopted by the shelter!',
	swappet = 'You have adopted another pet! Please take care of it! 🐶',
	buypet = 'You adopted a little one! Please take care of it! 🐶',
	pethealed = 'Your little darling is cured!',
    },
    primary = {
	shop = 'Press [E] to view the pet shelter!',
	sellpet = 'Adoption of a pet',
    },
    info = {
	releasepet = 'You let your pet go!',
	petaway = 'You have sent your pet back to its den!',
	hungry = 'Your pet is hungry!',
	petspawned = 'Your little darling has arrived!',
	petalreadyhere = 'Your little one is already here with you! Find it!',
	petspawning = 'Your pet needs time to find you.. Time: %{recentlySpawned}!',
	petfeed = 'Your pet will be hungry when: %{timeLeft}',
	retrieve = 'Your pet is ready to be called back..',
	petprogress = 'The way until your little friend becomes an adult %{xpp} / %{cfg}...🐶',
    close_1 = 'Pet Shelter Closed',
    close_2 = 'come back after ',
    close_3 = 'am',
    },
	label = {
	petshop = 'Pet Shelter',
	petshop_2 = 'Pet Shop',
	petshop_3 = 'Sell Pet',
	},
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

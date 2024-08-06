local Translations = {
    isuccess = {
        pdclothing1 = 'Going trough clothes',
        pdclothing2 = 'Searching my clothes',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

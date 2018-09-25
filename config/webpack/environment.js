const { environment } = require('@rails/webpacker')
const coffee =  require('./loaders/coffee')
const erb =  require('./loaders/erb')

environment.loaders.append('erb', erb)
environment.loaders.append('coffee', coffee)
module.exports = environment

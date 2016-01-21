require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  erb(:index)
end

get('/words/new') do
  erb(:dictionary_form)
end

get('/words') do
  @words = Word.all()
  erb(:words)
end

post('/words') do
  word_name = params.fetch('word_name')
  Word.new(:word_name => word_name).save()
  @words = Word.all()
  erb(:words)
end

get('/words/:id') do
  @words = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/words/:id/add_definition_form') do
  @words = Word.find(params.fetch('id').to_i())
  erb(:add_definition_form)
end

 post('/words/:id') do
    @words = Word.find(params.fetch('id').to_i())
    word_definition = params.fetch('word_definition')
    # @definition = Definitions.new(:word_definition => word_definition)
    # @definition.save()
    # @words.word_meanings.push(@definition)
    # @definitions = Definitions.all()
    @words.add_definition(word_definition)
    @definitions = Definitions.all()ß
    erb(:word)
  end

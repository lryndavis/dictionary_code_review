class Word
  attr_reader(:word_name)
  @@word_list = []

  define_method(:initialize) do |attributes|
     @word_name = attributes.fetch(:word_name)
     @word_name = word_name
     @id = @@word_list.length().+(1)
     @word_meanings = []
   end

  define_method(:id) do
    @id
  end

  define_method(:word_meanings) do
    @word_meanings
  end


  define_method(:add_definition) do |definition|
    word_meanings = []
    definition = Definitions.new(:word_definition => word_definition)
    definition.save()
    @word_meanings.push(definiton)
  end


  define_method(:save) do
    @@word_list.push(self)
  end

  define_singleton_method(:all) do
    @@word_list
  end

  define_singleton_method(:clear) do
    @@word_list = []
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@word_list.each() do |word|
      if word.id().eql?(id)
        found_word = word
      end
    end
    found_word
  end
end

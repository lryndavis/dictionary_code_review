class Definitions
  attr_reader(:word_definition)
  @@definitions_list = []

  define_method(:initialize) do |attributes|
    @word_definition = attributes.fetch(:word_definition)
    @id = @@definitions_list.length().+(1)
  end

  define_method(:id) do
    @id
  end

  define_method(:save) do
    @@definitions_list.push(self)
  end

  define_singleton_method(:all) do
    @@definitions_list
  end

  define_singleton_method(:clear) do
    @@definitions_list = []
  end
end

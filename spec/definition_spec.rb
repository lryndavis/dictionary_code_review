require('rspec')
require('definition')

describe(Definitions) do
  before() do
    Definitions.clear()
  end

    describe("#word_definition") do
      it("returns the definition") do
        test_definition = Definitions.new(:word_definition => "A Dog")
        expect(test_definition.word_definition()).to(eq("A Dog"))
      end
    end

    describe('#id') do
      it("returns the id of definition") do
        test_definition = Definitions.new(:word_definition => "A Dog")
        expect(test_definition.id()).to(eq(1))
      end
    end

    describe("#save") do
      it("adds a definition to an array of saved definitions") do
        test_definition = Definitions.new(:word_definition => "A Dog")
        test_definition.save()
        expect(Definitions.all()).to(eq([test_definition]))
      end
    end

    describe(".all") do
       it("is empty at first") do
         expect(Definitions.all()).to(eq([]))
       end
     end

     describe(".clear") do
        it("empties out all of the saved definitions") do
          Definitions.new(:word_definition => "A Dog").save()
          Definitions.clear()
          expect(Definitions.all()).to(eq([]))
        end
      end
    end

require('rspec')
require('word')

describe(Word) do
  before() do
    Word.clear()
  end

  describe('#word_name') do
   it("returns the word") do
     test_word = Word.new(:word_name => "Sherman")
     expect(test_word.word_name()).to(eq("Sherman"))
    end
  end

  describe('#id') do
    it("returns the id of the word") do
      test_word = Word.new(:word_name => "Sherman")
      expect(test_word.id()).to(eq(1))
    end
  end

  describe('#word_meanings') do
   it("initially returns an empty array of word definitions") do
     test_word = Word.new(:word_name => "Sherman")
     expect(test_word.word_meanings()).to(eq([]))
   end
 end

 describe("#save") do
   it("adds a word to an array of saved words") do
     test_word = Word.new(:word_name => "Sherman")
     test_word.save()
     expect(Word.all()).to(eq([test_word]))
   end
 end

 describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".clear") do
     it("empties out all of the saved words") do
       Word.new(:word_name => "Sherman").save()
       Word.clear()
       expect(Word.all()).to(eq([]))
     end
   end

   describe(".find") do
   it("returns a word by its id number") do
     test_word = Word.new(:word_name => "Sherman")
     test_word.save()
     test_word2 = Word.new(:word_name => "Damien")
     test_word2.save()
     expect(Word.find(test_word.id())).to(eq(test_word))
   end
 end
end

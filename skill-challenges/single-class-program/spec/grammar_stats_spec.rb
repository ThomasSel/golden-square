require "grammar_stats"

RSpec.describe GrammarStats do
  describe "#check" do
    grammar_stats = GrammarStats.new
    
    context "Initialised class" do
      it "#percentage_good returns 100" do
        expect(grammar_stats.percentage_good).to eq 100
      end
    end

    context "#check empty string" do
      it "returns true" do
        expect(grammar_stats.check("")).to eq true
      end
    end
    
    context "#check capitalized string with no ending punctuation" do
      it "returns false" do
        expect(grammar_stats.check("Hello world")).to eq false
      end
    end

    context "#check capitalized string with ending punctuation" do
      ".?!".chars.each do |char|
        it "#{char} returns true" do
          expect(grammar_stats.check("Hello world" + char)).to eq true
        end
      end

      ";+".chars.each do |char|
        it "#{char} returns false" do
          expect(grammar_stats.check("Hello world" + char)).to eq false
        end
      end
    end

    context "#check uncapitalized string with valid ending punctuation" do
      ".?!".chars.each do |char|
        it "#{char} returns false" do
          expect(grammar_stats.check("hello world" + char)).to eq false
        end
      end
    end

    context "#check Multi-sentence text, second sentence doesn't end with punctuation" do
      it "returns false" do
        result = grammar_stats.check("This sentence has good grammar. The second sentence doesn't end with punctation")
        expect(result).to eq false
      end
    end

    context "#check Multi-sentence text, second sentence isn't capitalized" do
      it "returns true" do
        result = grammar_stats.check("This sentence has good grammar. the second sentence doesn't start with a capital!")
        expect(result).to eq true
      end
    end

    it "#check raises error when input nil" do
      expect { grammar_stats.check(nil) }.to raise_error "ERROR - Input cannot be nil"
    end
  end

  describe "#percentage_good" do
    context "after 0 failures 1 success" do
      it "returns 100" do
        grammar_stats = GrammarStats.new
        grammar_stats.check("Hello.")
        expect(grammar_stats.percentage_good).to eq 100
      end
    end
    
    grammar_stats = GrammarStats.new
    
    context "after 1 failure 0 successes" do
      it "returns 0" do
        grammar_stats.check("hello")
        expect(grammar_stats.percentage_good).to eq 0
      end
    end

    context "after 2 failures 0 successes" do
      it "returns 0" do
        grammar_stats.check("hello")
        expect(grammar_stats.percentage_good).to eq 0
      end
    end

    context "after 2 failures 1 success" do
      it "returns 33" do
        grammar_stats.check("Hello.")
        expect(grammar_stats.percentage_good).to eq 33
      end
    end
    
    context "after 2 failures 2 successes" do
      it "returns 50" do
        grammar_stats.check("Hello.")
        expect(grammar_stats.percentage_good).to eq 50
      end
    end

    context "after 2 failures 3 successes" do
      it "returns 60" do
        grammar_stats.check("Hello.")
        expect(grammar_stats.percentage_good).to eq 60
      end
    end

    context "after 3 failures 3 successes" do
      it "returns 50" do
        grammar_stats.check("Hello")
        expect(grammar_stats.percentage_good).to eq 50
      end
    end
  end
end

# 1.0
# 0.5
# 0.6666666666666666
# 0.75
# 0.8
# 0.6666666666666666
# 0.5714285714285714
# 0.5
# 0.4444444444444444
# 0.4
# 0.36363636363636365
# 0.4166666666666667
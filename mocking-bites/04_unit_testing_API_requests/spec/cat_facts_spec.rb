require "cat_facts"

RSpec.describe CatFacts do
  it "provides a cat fact" do
    fake_requester = double(:requester)
    allow(fake_requester).to receive(:get)
      .with(URI("https://catfact.ninja/fact"))
      .and_return('{"fact":"A female cat will be pregnant for approximately 9 weeks or between 62 and 65 days from conception to delivery.","length":110}')

    cat_facts = CatFacts.new(fake_requester)
    expect(cat_facts.provide).to eq "Cat fact: A female cat will be pregnant for approximately 9 weeks or between 62 and 65 days from conception to delivery."
    expect(cat_facts.provide).to eq "Cat fact: A female cat will be pregnant for approximately 9 weeks or between 62 and 65 days from conception to delivery."
  end
end

# A typical response from https://catfact.ninja/fact
#  looks like {"fact":"A female cat will be pregnant for approximately 9 weeks or between 62 and 65 days from conception to delivery.","length":110}
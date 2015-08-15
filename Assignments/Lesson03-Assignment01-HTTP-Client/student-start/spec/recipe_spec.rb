require_relative "../module3_1_assignment"
require 'rspec'
require 'rspec/its'
require 'webmock/rspec'

describe Recipe do
  subject { Recipe }

  it { is_expected.to respond_to(:for) } 
  its(:default_params) { is_expected.to include onlyImages: 1 }
  its(:base_uri) { is_expected.to include "http://www.recipepuppy.com/api" }

  context "Chocolate Search" do
    before :each do
      query = Recipe.default_params.merge({"q" => "chocolate"})
      stub_request(:get, Recipe.base_uri).
         with(query: query).
         to_return(body: File.read('chocolate_recipes.json'), status: 200, headers: {'Content-Type' => 'application/json'})
    end

    subject{ Recipe.for("chocolate") }
    it { is_expected.to be_an Array }
    its(:size) { is_expected.to eq 10 }
  end

end
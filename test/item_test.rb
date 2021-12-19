require 'test_helper'

module CONTENTdmAPI

  describe Item do
    describe "when a valid single record has been requested" do
      it 'produces a single ruby hash representing the item' do
        ::VCR.use_cassette("item_valid_single_record") do
          compound = Item.new(base_url: 'https://server16022.contentdm.oclc.org/dmwebservices/index.php', collection: 'winona', id: 680)
          result = compound.metadata
          fixture = eval(File.read("#{ROOT_DIR}/fixtures/contentdm/item_valid_single_record.rb"))
          _(result).must_equal(fixture)
        end
      end
    end

    describe "when a valid compound record has been requested" do
      it 'produces a single ruby hash representing the item' do
        ::VCR.use_cassette("item_single_ruby_hash") do
          compound = Item.new(base_url: 'https://server16022.contentdm.oclc.org/dmwebservices/index.php', collection: 'p16022coll39', id: 446)
          result = compound.metadata
          fixture = eval(File.read("#{ROOT_DIR}/fixtures/contentdm/item_single_ruby_hash.rb"))
          _(result).must_equal(fixture)
        end
      end

      it "can iterate over it's compounds" do
        ::VCR.use_cassette("item_can_iterate_compounds") do
          item = Item.new(base_url: 'https://server16022.contentdm.oclc.org/dmwebservices/index.php', collection: 'p16022coll39', id: 446)
          item.compounds_to_h do |compound|
            fixture = eval(File.read("#{ROOT_DIR}/fixtures/contentdm/item_can_iterate_compounds.rb"))
            _(compound).must_equal(fixture)
            return
          end
        end
      end

      describe 'but no compound item has been requested' do
        it 'returns a hash for the item' do
          ::VCR.use_cassette("item_no_compound_item_requested") do
            compound = Item.new(with_compound: false, base_url: 'https://server16022.contentdm.oclc.org/dmwebservices/index.php', collection: 'p16022coll39', id: 446)
            fixture = eval(File.read("#{ROOT_DIR}/fixtures/contentdm/item_no_compound_item_requested.rb"))
            _(compound.metadata).must_equal(fixture)
          end
        end
      end

      describe 'when an item presents an array of arrays for compounds instead of an array of hashes' do
        it 'returns an empty compound' do
          ::VCR.use_cassette("item_array_of_arrays") do
            compound = Item.new(with_compound: false, base_url: 'https://server16022.contentdm.oclc.org/dmwebservices/index.php', collection: 'gust', id: 373)
            fixture = eval(File.read("#{ROOT_DIR}/fixtures/contentdm/item_array_of_arrays.rb"))
            _(compound.metadata).must_equal(fixture)
          end
        end
      end

      describe 'when a compound has only one item' do
        it 'returns an array with a single hash (instead of what the CONTENTdm API actually gives us, which is just a hash' do
          ::VCR.use_cassette("item_compound_has_one_item") do
            compound = Item.new(base_url: 'https://server16022.contentdm.oclc.org/dmwebservices/index.php', collection: 'p15160coll1', id: 1899)
            fixture = eval(File.read("#{ROOT_DIR}/fixtures/contentdm/item_compound_has_one_item.rb"))
            _(compound.metadata).must_equal(fixture)
          end
        end
      end
    end
  end
end

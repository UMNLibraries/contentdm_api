require 'test_helper'

class ContentdmTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Contentdm::VERSION
  end
end

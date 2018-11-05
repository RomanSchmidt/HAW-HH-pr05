require 'test/unit'
require './Task2/Error/ambiguous_v2_error'
require './Task2/address_v2'
require './Task2/partner_v2'

class AddressV2Test < Test::Unit::TestCase

  def test_create_succ
    address = AddressV2.new('street1', 1, 'zip1', 'city1', 'country1')
    assert_true(address.is_a? AddressV2)
  end

  def test_create_err_double
    address = AddressV2.new('street2', 2, 'zip2', 'city2', 'country2')
    assert_true(address.is_a? AddressV2)
    assert_raise(AmbiguousV2Error) do
      AddressV2.new('street2', 2, 'zip2', 'city2', 'country2')
    end
  end

  def test_create_err_street_empty1
    assert_raise(ArgumentError) do
      AddressV2.new(nil, 1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_street_empty2
    assert_raise(ArgumentError) do
      AddressV2.new('    ', 1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_street_int
    assert_raise(ArgumentError) do
      AddressV2.new(1, 1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_house_empty1
    assert_raise(ArgumentError) do
      AddressV2.new('street3', nil, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_house_empty2
    assert_raise(ArgumentError) do
      AddressV2.new('street4', -1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_house_str
    assert_raise(ArgumentError) do
      AddressV2.new('street5', '1', 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_zip_empty1
    assert_raise(ArgumentError) do
      AddressV2.new('street6', 1, nil, 'city1', 'country1')
    end
  end

  def test_create_err_zip_empty2
    assert_raise(ArgumentError) do
      AddressV2.new('street7', 1, '   ', 'city1', 'country1')
    end
  end

  def test_create_err_zip_int
    assert_raise(ArgumentError) do
      AddressV2.new('street8', 1, 1, 'city1', 'country1')
    end
  end

  def test_create_err_city_empty1
    assert_raise(ArgumentError) do
      AddressV2.new('street9', 1, 'zip1', nil, 'country1')
    end
  end

  def test_create_err_city_empty2
    assert_raise(ArgumentError) do
      AddressV2.new('street10', 1, 'zip1', '   ', 'country1')
    end
  end


  def test_create_err_city_int
    assert_raise(ArgumentError) do
      AddressV2.new('street11', 1, 'zip1', 1, 'country1')
    end
  end

  def test_create_err_country_empty1
    assert_raise(ArgumentError) do
      AddressV2.new('street12', 1, 'zip1', 'city1', nil)
    end
  end

  def test_create_err_country_empty2
    assert_raise(ArgumentError) do
      AddressV2.new('street13', 1, 'zip1', 'city1', '      ')
    end
  end

  def test_create_err_country_int
    assert_raise(ArgumentError) do
      AddressV2.new('street14', 1, 'zip1', 'city1', 1)
    end
  end

  def test_succ_each
    address = AddressV2.new('street_test_each_1', 1, 'zip', 'city', 'country')
    found = 0
    address.each_partner do |partner|
      found += 1
    end
    assert_equal(0, found)
    partner = []
    partner << PartnerV2.new('first_name_test_each1', 'last_name', address)
    found = 0
    address.each_partner do |partner_of_each|
      found += 1
      assert_true(partner_of_each === partner[0])
    end
    assert_equal(1, found)

    partner << PartnerV2.new('first_name_test_each2', 'last_name', address)
    found = 0
    address.each_partner do |partner_of_each|
      assert_true(partner_of_each === partner[found])
      found += 1
    end
    assert_equal(2, found)
  end
end
require 'test/unit'
require './Task3/partner_v3'
require './Task3/Error/ambiguous_v3_error'

class PartnerV3Test < Test::Unit::TestCase

  def test_create_succ
    partner = PartnerV3.new('partner_name1', 'last_name1')
    assert_true(partner.is_a? PartnerV3)
  end

  def test_create_err_double
    partner = PartnerV3.new('partner_name2', 'last_name2')
    assert_true(partner.is_a? PartnerV3)
    assert_raise(AmbiguousV3Error) do
      PartnerV3.new('partner_name2', 'last_name2')
    end
  end

  def test_create_err_fname_empty1
    assert_raise(ArgumentError) do
      PartnerV3.new(nil, 'last_name1')
    end
  end

  def test_create_err_fname_empty2
    assert_raise(ArgumentError) do
      PartnerV3.new('   ', 'last_name1')
    end
  end

  def test_create_err_fname_int
    assert_raise(ArgumentError) do
      PartnerV3.new(1, 'last_name1')
    end
  end

  def test_create_err_lname_empty1
    assert_raise(ArgumentError) do
      PartnerV3.new('partner_name3', nil)
    end
  end

  def test_create_err_lname_empty2
    assert_raise(ArgumentError) do
      PartnerV3.new('partner_name4', '   ')
    end
  end

  def test_create_err_lname_int
    assert_raise(ArgumentError) do
      PartnerV3.new('partner_name5', 1)
    end
  end
end
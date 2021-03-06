# -*- encoding : utf-8 -*-
describe RegApi2::Common do

  include RegApi2

  describe :nop do
    it "should raise nothing" do
      lambda { common.nop }.should_not raise_error
    end
    it "should return login" do
      common.nop.login.should == RegApi2.username
    end
  end

  describe :reseller_nop do
    it "should raise nothing" do
      lambda { common.reseller_nop }.should_not raise_error
    end
    it "should return login" do
      common.reseller_nop.login.should == RegApi2.username
    end
  end

  describe :get_user_id do
    it "should raise nothing" do
      lambda { common.get_user_id }.should_not raise_error
    end
    it "should return user id" do
      common.get_user_id.should be_kind_of(Fixnum)
    end
  end

  describe :get_service_id do
    it "should raise nothing" do
      lambda { common.get_service_id(service_id: 123456) }.should_not raise_error
    end
    it "should return user id" do
      common.get_service_id(service_id: 123456) == 123456
    end
  end
end

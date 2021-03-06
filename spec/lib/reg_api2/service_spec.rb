# -*- encoding : utf-8 -*-
describe RegApi2::Service do

  include RegApi2

  describe :nop do
    it "should return list of services if requested" do
      ans = service.nop(services: [
        { dname:"test.ru" },
        { dname: "test.su", servtype: "srv_hosting_ispmgr" },
        { service_id: 111111 },
        { service_id: "22bug22" },
        { surprise: "surprise.ru" }
      ])
      ans.services.map do |rec|
        rec.result == 'success' ? rec.dname : rec.error_code
      end.sort.should == %w[ INVALID_SERVICE_ID NO_DOMAIN test.ru test.su test12347.ru ]
    end
  end

  describe :get_prices do
    it "should return prices" do
      ans = service.get_prices show_renew_data: true
      ans.should have_key :prices
    end
  end

  describe :get_servtype_details do
    it "should return service type details" do
      ans = service.get_servtype_details servtype: :srv_hosting_ispmgr
      ans.first.should have_key :commonname
    end
  end

  describe :create do
    it "should create srv_hosting_ispmgr service" do
      ans = service.create dname: 'qqq.ru', servtype: :srv_hosting_ispmgr, period: 1, plan: 'Host-2-1209'
      ans.descr.should =~ /srv_hosting_ispmgr.+ordered/
    end
  end

  describe :delete do
    it "should remove srv_hosting_ispmgr service" do
      ans = service.delete domain_name: 'test.ru', servtype: :srv_hosting_ispmgr
      ans.should be_nil
    end
  end
end

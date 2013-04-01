describe "Quickeebooks::Windows::Service::SyncActivity" do
  before(:all) do
    FakeWeb.allow_net_connect = false
    qb_key = "key"
    qb_secret = "secreet"

    @realm_id = "9991111222"
    @base_uri = "https://qbo.intuit.com/qbo36"
    @oauth_consumer = OAuth::Consumer.new(qb_key, qb_key, {
        :site                 => "https://oauth.intuit.com",
        :request_token_path   => "/oauth/v1/get_request_token",
        :authorize_path       => "/oauth/v1/get_access_token",
        :access_token_path    => "/oauth/v1/get_access_token"
    })
    @oauth = OAuth::AccessToken.new(@oauth_consumer, "blah", "blah")
  end

  it "can fetch a list of sync_activites" do
    xml = windowsFixture("sync_activites.xml")
    model = Quickeebooks::Windows::Model::SyncActivity
    service = Quickeebooks::Windows::Service::SyncActivity.new
    service.access_token = @oauth
    service.realm_id = @realm_id
    FakeWeb.register_uri(:post, service.url_for_resource(model::REST_RESOURCE), :status => ["200", "OK"], :body => xml)
    sync_activites = service.list
    sync_activites.entries.count.should == 4
    my_sync = time_activities.entries.first
    my_sync.sync_type.should == "Writeback"
    my_sync.start_sync_tms.should == "2011-06-02T15:39:20.0"
    my_sync.end_sync_tms.should == "2011-06-02T15:40:02.0"
    my_sync.entity_name.should == "SalesOrder"
    my_sync.entity_row_count.should == "1"
  end

end
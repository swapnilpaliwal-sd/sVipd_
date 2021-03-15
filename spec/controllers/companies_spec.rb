require 'rails_helper'
if RUBY_VERSION>='2.6.0'
  if Rails.version < '5'
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        # hack to avoid MonitorMixin double-initialize error:
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end
RSpec.describe CompaniesController, :type => :controller do

  it "renders the index template" do
    get :index
    expect(response).to render_template("index")
  end  
  it "returns a 200" do
    request.headers["Authorization"] = "foo"
    get :index
    expect(response).to have_http_status(:ok)
  end
end
 
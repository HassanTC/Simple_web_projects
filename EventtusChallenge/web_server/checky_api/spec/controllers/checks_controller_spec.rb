require 'rails_helper'

RSpec.describe ChecksController, type: :controller do
  context "GET #find" do

    before(:each) do
      rgem = create(:rgem, name: "testing_gem")
      os   = create(:osystem, name: "testing_os")
      lib  = create(:systemlib, name: "testing_lib")
      info = create(:information,rgem_id: rgem.id,
                   osystem_id: os.id,
                   systemlib_id: lib.id)
    end

    context "when result is not found" do
      it "return not found if no data" do
        get :find
        expect(response).to have_http_status(:not_found)
      end

      it "return right json structure when not found" do
        not_found_res = {:erorr=> 'Not found!', :status=>404}.to_json
        get :find
        expect(response.body).to eq not_found_res
      end
    end

    context "when result found" do
      it "return data if any" do
        get :find, {"os_name"=>"testing_os", "gem_name"=>"testing_gem"}
        expect(response).to have_http_status(:success)
      end

      it "return right json structure  if any" do
        get :find, {"os_name"=>"testing_os", "gem_name"=>"testing_gem"}
        found_res = {:total => 1, :libararies => ["testing_lib"],
                    :install_code => "apt-get install", :status => 200}.to_json
        expect(response.body).to eq found_res
      end
    end
  end

  context "post #add" do
    it "returns http success if created succefually" do
      post :add, {"gemname"=>"new_test", "install_code"=>"sudo apt",
                  "os_name"=>"fedra", "systemlib_name" => "libtest" }
      expect(response).to have_http_status(:success)
    end

    it "return errors when invalid" do
      post :add
      failed_value = {"erorrs":{"rgem_id":["can't be blank"],
                      "systemlib_id":["can't be blank"],
                      "osystem_id":["can't be blank"]}
                      }.to_json
      expect(response.body).to eq failed_value
    end

    it "return 422 when invalid" do
      post :add
      expect(response.code).to eq "422"
    end
  end
  describe "GET #home" do

    it "renders the :home info about the project" do
      expect(get: root_url(subdomain: nil)).to route_to(
        controller: "checks",
        action: "home")
    end

  end
end

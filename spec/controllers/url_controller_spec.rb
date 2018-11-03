# describe "POST create" do
#   context "with valid attributes" do
#     it "creates a new url" do
#       expect{
#         post :create, url: Factory.attributes_for(:url)
#       }.to change(Url,:count).by(1)
#     end

#     it "redirects to the new url" do
#       post :create, url: Factory.attributes_for(:url)
#       response.should redirect_to Url.last
#     end
#   end

#   context "with invalid attributes" do
#     it "does not save the new url" do
#       expect{
#         post :create, url: Factory.attributes_for(:invalid_url)
#       }.to_not change(Url,:count)
#     end

#     it "re-renders the new method" do
#       post :create, url: Factory.attributes_for(:invalid_url)
#       response.should render_template :new
#     end
#   end 
# end

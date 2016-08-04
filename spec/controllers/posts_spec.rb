require "rails_helper"

module Api
  describe PostsController, type: :controller do

    describe "GET #index" do
      let!(:posts) { FactoryGirl.create_list(:post, 2) }
      before { get :index }

      it "has a 200 status code" do
        expect(response.status).to eq(200)
      end

      it "populates an array of all posts" do
        expect(assigns(:posts)).to match_array(posts)
      end
    end

    describe "POST #create" do
        it "saves the new post in the database" do
          expect { post :create, params: { post: FactoryGirl.attributes_for(:post) } }.
            to change(Post, :count).by(1)
          expect(response.status).to eq(201)
        end
    end

    describe "creates post before action" do
      let!(:post) { FactoryGirl.create(:post) }
      describe "GET #show" do
        before { get :show, params: { id: post } }

        it "assigns the requested post to @post" do
          expect(assigns(:post)).to eq post
        end
      end

      describe "PUT #update" do
        it "changes post title" do
          put :update, params: { id: post.id, 
                                 post: FactoryGirl.attributes_for(:post, title: "new title")
                               }
          post.reload
          expect(post.title).to eq "new title"
        end
      end

      describe "DELETE #destroy" do
        it "deletes post" do
          expect { delete :destroy, params: { id: post.id } }.
            to change(Post, :count).by(-1)
        end
      end
    end
  end
end
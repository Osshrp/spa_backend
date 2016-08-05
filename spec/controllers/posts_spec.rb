require "rails_helper"

module Api
  describe PostsController, type: :request do

    describe "GET #index" do
      let!(:posts) { FactoryGirl.create_list(:post, 2) }
      before { get api_posts_url }

      it "has a 200 status code" do
        expect(response.status).to eq(200)
      end

      it "populates an array of all posts" do
        expect(response.body).to eq(posts.to_json)
      end
    end

    describe "POST #create" do
      it "saves the new post in the database" do
        post api_posts_url, params: { post: FactoryGirl.attributes_for(:post) }
        expect(response.content_type).to eq("application/json")
        expect(response.body).to include("created")
        expect(response.status).to eq(201)
      end
    end

    describe "creates post before action" do
      let!(:post) { FactoryGirl.create(:post) }
      describe "GET #show" do
        before { get api_post_path(post), params: { id: post } }

        it "assigns the requested post to @post" do
          expect(response.body).to eq post.to_json
        end
      end

      describe "PUT #update" do
        it "changes post title" do
          put api_post_path(post), params:
            { id: post.id, 
              post: FactoryGirl.attributes_for(:post, title: "new title")
            }
          expect(JSON.parse(response.body)["title"]).to eq "new title"
        end
      end

      describe "DELETE #destroy" do
        it "deletes post" do
          expect { delete api_post_path(post), params: { id: post.id } }.
            to change(Post, :count).by(-1)
        end
      end
    end
  end
end
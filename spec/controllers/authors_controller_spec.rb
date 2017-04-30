require "rails_helper"

describe AuthorsController, type: :controller do 	
  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do	
    it "assigns the requested author to @author" do
      author = create(:author)
      get :show, params: { id: author.to_param }
      expect(assigns(:author)).to eq author
    end

    it "renders the :show template" do
      author = create(:author)
      get :show, params: { id: author.to_param }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new Author to @author" do
      get :new
      expect(assigns(:author)).to be_a_new(Author)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested Author to @author" do
      author = create(:author)
      get :edit, params:  {id: author.to_param }
      expect(assigns(:author)).to eq author
    end

    it "renders the :edit to @author" do
      author = create(:author)
      get :edit, params: { id: author.to_param }
      expect(response).to render_template :edit
    end
  end
  
  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new author in the database" do
        expect {
          post :create, params: { author: attributes_for(:author) }
        }.to change(Author, :count).by(1)
      end

      it "redirects to authors#show" do
        post :create, params: { author: attributes_for(:author) }
        expect(response).to redirect_to author_path(assigns[:author])
      end
    end
    context "with invalid params" do
      it "assigns a newly created but unsaved author as @author" do
        expect {
          post :create, params: { author: attributes_for(:invalid_author) }
        }.to_not change(Author, :count)
      end
    end
  end

  describe 'POST #update' do
    context "with valid attributes" do
      it "updates the requested author" do
        author = create(:author)
        put :update, params: {id: author.to_param, author: attributes_for(:new_attr_author) }
        author.reload
        expect(author.biography).to eq('a'*600)
        expect(author.birthplace).to eq('a'*40)
      end
      it "redirects to the author" do
        author = create(:author)
        put :update, params: {id: author.to_param, author: attributes_for(:author) }
        expect(response).to redirect_to(author)
      end
    end

    context "with invalid attributes" do
      it "assigns the author as @author" do
        author = create(:author)
        put :update, params: {id: author.to_param, author: attributes_for(:invalid_author) }
        author.reload
        expect(assigns(:author)).to_not eq(:invalid_author)
      end
      it "re-renders the edit template" do
        author = create(:author)
        put :update, params: {id: author.to_param, author: attributes_for(:invalid_author) }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'Delete #destroy' do 
    it "destroys the requested person" do
      author = create(:author)
      expect {
        delete :destroy, params: { id: author.to_param }
      }.to change(Author, :count).by(-1)
    end

    it "redirects to the authors list" do
      author = create(:author)
      delete :destroy, params: { id: author.to_param }
      expect(response).to redirect_to author_url
    end
  end
end
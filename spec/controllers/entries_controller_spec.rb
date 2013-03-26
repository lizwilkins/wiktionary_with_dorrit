require 'spec_helper'

describe EntriesController do
  context 'routing' do
    it {should route(:post, '/entries').to :action => :create}
    it {should route(:get, '/entries/1').to :action => :show, :id => 1}
    it {should route(:put, '/entries/1').to :action => :update, :id => 1}
    it {should route(:delete, '/entries/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/entries').to :action => :index}
  end

  context 'POST create' do
    
    context 'with valid parameters' do
      let(:valid_attributes) {{:word => 'cat', :definition => 'dogs best friend'}}
      let(:valid_parameters) {{:entry => valid_attributes}}

      it 'creates a new entry' do
        expect {post :create, valid_parameters}.to change(Entry, :count).by(1)
      end

      before {post :create, valid_parameters}
      it {should respond_with 201}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the newly-created entry' do
        response.body.should eq Entry.find(JSON.parse(response.body)['entry']['id']).to_json
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:word => '', :definition => ''}}
      let(:invalid_parameters) {{:entry => invalid_attributes}}

      before {post :create, invalid_parameters}

      it {should respond_with 422}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the errors' do
        response.body.should eq Entry.create(invalid_attributes).errors.to_json
      end
    end

  end

  context 'GET show' do
    let(:entry) {FactoryGirl.create :entry}
    before {get :show, :id => entry.id}

    it {should respond_with 200}
    it {should respond_with_content_type :json}
    it 'responds with a json representation of the entry' do
      response.body.should eq entry.to_json
    end
  end

  # context 'PUT update' do
  #   let(:entry) {FactoryGirl.create :entry}

  #   context 'with valid parameters' do
  #     let(:valid_attributes) {{:email => 'michael@epicodus.com'}}
  #     let(:valid_parameters) {{:id => entry.id, :entry => valid_attributes}}
  #     before {put :update, valid_parameters}

  #     it 'updates the entry' do
  #       Entry.find(entry.id).email.should eq valid_attributes[:email]
  #     end

  #     it {should respond_with 200}
  #     it {should respond_with_content_type :json}
  #     it 'responds with a json representation of the updated entry' do
  #       response.body.should eq entry.reload.to_json
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     let(:invalid_attributes) {{:name => ''}}
  #     let(:invalid_parameters) {{:id => entry.id, :entry => invalid_attributes}}
  #     before {put :update, invalid_parameters}

  #     it {should respond_with 422}
  #     it {should respond_with_content_type :json}

  #     it 'responds with a json representation of the errors' do
  #       entry.update_attributes(invalid_attributes)
  #       response.body.should eq entry.errors.to_json
  #     end
  #   end
  # end

  # context 'DELETE destroy' do
  #   it 'destroys a entry' do
  #     entry = FactoryGirl.create :entry
  #     expect {delete :destroy, {:id => entry.id}}.to change(Entry, :count).by(-1)
  #   end

  #   let(:entry) {FactoryGirl.create :entry}
  #   before {delete :destroy, {:id => entry.id}}

  #   it {should respond_with 204}
  # end

  # context 'GET index' do
  #   before {Entry.create({:name => 'michael'})}
  #   before {get :index}

  #   it {should respond_with 200}
  #   it {should respond_with_content_type :json}
  #   it 'responds with a json representation of all the entrys' do
  #     response.body.should eq Entry.all.to_json
  #   end
  # end
end

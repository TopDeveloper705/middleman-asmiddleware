require 'middleman/as_middleware'

describe 'mounting middleman as middleware' do
  let(:response) { [200,{},['OK']] }

  it 'takes a rack app and a middleman server' do
    app, server = double, double
    Middleman::AsMiddleware.new app, server
  end

  it 'defaults the server to being Middleman.server' do
    app, server = double, double
    Middleman.should receive(:server).and_return server
    Middleman::AsMiddleware.new app
  end

  shared_examples_for "calls the middleman server" do
    it 'calls the server' do
      expect(server).to have_received(:call).with(env)
    end

    it 'calls the server with a duplicate of the environment' do
      expect(server).to have_received(:call) do |provided_env|
        expect(provided_env).to eq env
        provided_env.delete(:key)
        expect(provided_env).to_not eq env
      end
    end
  end

  context 'middleman can handle the request' do
    let(:server) { double "middleman", call: response }
    let(:app)    { double "rack app" }
    let(:env)    { { key: :value, more: :data } }

    let!(:middleware_response) { Middleman::AsMiddleware.new(app,server).call env }

    it_should_behave_like "calls the middleman server"

    it 'returns the middleman response' do
      expect(middleware_response).to eq response
    end
  end

  context 'middleman cant handle the request' do
    let(:server) { double "middleman", call: [404,{},[]] }
    let(:app)    { double "rack app",  call: response }
    let(:env)    { { key: :value, more: :data } }

    let!(:middleware_response) { Middleman::AsMiddleware.new(app,server).call env }

    it_should_behave_like "calls the middleman server"

    it 'calls the app' do
      expect(app).to have_received(:call).with(env)
    end
    it 'returns the apps response' do
      expect(middleware_response).to eq response
    end
  end
end

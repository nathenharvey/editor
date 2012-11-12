require 'chefspec'

describe 'editor::default' do
  let(:runner) { ChefSpec::ChefRunner.new.converge('editor::default') }

  it 'creates the /etc/profile.d/editor.sh template' do
    runner.should create_file_with_content('/etc/profile.d/editor.sh', 'export EDITOR=/usr/bin/vim.basic')
  end

  it 'sets the correct editor value' do
    runner = ChefSpec::ChefRunner.new do |node|
      node['editor'] = {
        'default' => 'nano'
      }
    end
    runner.converge('editor::default')
    runner.should create_file_with_content('/etc/profile.d/editor.sh', 'export EDITOR=nano')
  end
end

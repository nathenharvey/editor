#
# Author:: Seth Vargo <sethvargo@gmail.com>
# Cookbook Name:: editor
# Spec:: default
#
# Copyright 2012, Seth Vargo
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

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

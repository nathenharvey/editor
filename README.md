Editor
======
[![Build Status](https://secure.travis-ci.org/sethvargo-cookbooks/editor.png?branch=master)](https://travis-ci.org/sethvargo-cookbooks/editor)

Set the default system wide editor with Chef

Installation
------------
I highly recommend using Berkshelf:

```ruby
# Berksfile
cookbook 'editor'
```

Alternatively, you can install from the community site:

    knife cookbook site install editor

Usage
-----
In your recipe or role, set the node's default editor attribute to whatever you want:

```javascript
{
  "override_attributes": {
    "editor": {
      "default": "nano"
    }
  }
}
```

Then, just include the recipe:

```javascript
{
  "run_list": {
    "recipe[editor]"
  }
}
```

Contributing
------------
1. Fork the project
2. Create a feature branch corresponding to you change
3. Commit and test thoroughly
4. Create a Pull Request on github
    - ensure you add a detailed description of your changes

License and Authors
-------------------
- Author:: Seth Vargo (sethvargo@gmail.com)

Copyright 2012, Seth Vargo

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

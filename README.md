
web_app Cookbook
========================

This cookbook will install web_app on Liux OS.

Attributes
==================
#### web_app::default

| Key | Type | Description | Default |
| --- | ---- | ----------- | ------- |
| ['web_app']['current_path'] | String | path to cloned repository | '/var/www/projects/webapp/current' |
| ['web_app']['release_path'] | String | path to release | 'var/www/projects/webapp/release' |

Usage
==================
#### 'web_app'::default

Just include `web_app` in your cookbook:

    include_recipe 'web_app'

If you wish to change a current or/and release path, e.g: var/tmp/my_path

	{
	  "web_app": {
		"current_path": "var/tmp/my_path"
		}    
	}

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Michael Vershinin

Support
-------------------
goldver@gmail.com



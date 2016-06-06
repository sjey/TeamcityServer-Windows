A cookbook to bring up teamcity server 9x and agent on a vagrant box.

Steps to install:

1. Create a box windows server 12 box file. If you have any existing box file, you can use it
2. Download this repo.
3. Move to cookbooks/teamcity directory and berks init &&  bundle install
4. vagrant up


TODO:

1. Add windows SDK recipe. Currently is not working
2. Add other required packages.

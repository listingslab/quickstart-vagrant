
## Quickstart Vagrant Development Environment for Magento

### Get Ready ...

Designed to help you get up and running developing a Magento store on a Vagrant Virtual Machine. You need a machine provisioned with the prerequisite software [Vagrant 1.8+](https://www.vagrantup.com.html), [VirtualBox](https://www.virtualbox.org) and [Git](https://git-scm.com), so our first job is to clone this repo locally.

1. If you don't already have one, create a working directory for your Vagrant projects. As you work on various projects, you will be creating new VM's for each so we'll create a directory to keep them all in. Choose whichever name and location suits you, or follow this instructions to create, change the permissions and switch to a directory called `/vagrant` on root level.

    At this point we'll also make sure the Vagrant hostmanager is installed so that Vagrant can handle our host names and we don't have to mess around with our host file.

    Open terminal and run:

```bash
sudo mkdir /vagrant
sudo chown -R $USER:$USER /vagrant
cd /vagrant
vagrant plugin install vagrant-hostmanager
```

2. Decide on a project name. This is going to be both our project director name and make part of the url we will connect to the box on. Make your project name url compatible. Clone this magento-vagrant repository into a new directory by changing `quickstart-vagrant-magento` to a name of your choice and run:
```bash
cd /vagrant
git clone git@bitbucket.org:aligent/quickstart-vagrant-magento.git quickstart-vagrant-magento
```

3. We don't want to push to this repository, so we'll remove the git tracking and initialise a new repo.

```bash
cd quickstart-vagrant-magento
sudo rm -r .git
sudo rm .gitignore
git init
git add .
git commit -m 'Initial commit'
```

4. __Optional.__ You might want to setup a repo on BitBucket for your project which you can do on [Aligent's Frontend Sandbox project](https://bitbucket.org/account/user/aligent/projects/FS). If so, once you have created your empty repo, set the origin and push the code by running:
```bash
git remote add origin <repo-address>
git push origin master
```

4. Create a new project in PhpStorm by selecting File > New Project, selecting the magento-vagrant folder as the Location. You might get a warning telling you that the existing directory is not empty and asking if you'd like to create from existing source. Select Yes and Open in in a new window.

5. The most important file in this project is called Vagrantfile. Open it up and take a look.

    Edit the PROJECT_NAME variable to be the same as your `quickstart-vagrant-magento`. This is important as it will also become part of the url you use to access your magento installation.

### Go ...
From your project directory run:

```bash
sudo vagrant up
```
This simple command will setup everything for you. But if you're running it for the first time, then Vagrant's built in hostmanager is going to try to add your project's url to your `/etc/hosts` file. For this it will need you to enter your sudo password, so don't grab a coffee yet.

  Once your virtual box is up and running, the provisioning will get underway. Now is the time to grab a coffee.
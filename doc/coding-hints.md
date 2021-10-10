# Coding Hints

### What is the source control layout? ###

* Use the `git flow` branching model.
* Feature branches should be kept, and named `feature/yyyy-mm-dd-feature` (eg: `feature/2020-06-16-ruby-upgrade`)
* Do work on your feature branch. We then merge into the develop branch.
* **Do not use** `git push --force`. You may squash-commit your feature branch if you choose, but it's not required.

### Git Flow extension (optional) ###

Optionally use the Git Flow extension to automate feature creation.

* https://jeffkreeftmeijer.com/git-flow/
* https://github.com/petervanderdoes/gitflow-avh/wiki/Installing-on-Mac-OS-X

```
brew install git-flow-avh
```

### Typical Git Workflow

###### STEP 0: Update your /develop branch
Before starting a feature, make sure your `develop` branch is up to date:
```
git checkout develop
git pull --rebase origin
```

###### STEP 1: Create feature branch
To start a feature branch, use `git flow feature start` or create a branch yourself:
```
git checkout -b feature/`date +%Y-%m-%d`-your-feature
```

Commit to your feature branch as you work. Any time you push to the origin a build will run in CircleCI:
```
git commit -m 'My changes'
git push origin
```

###### STEP 2: Bring feature branch up to date
When ready to create a pull request for review, first update `develop`, then merge `develop` into your feature branch. This brings your feature branch up to date with the latest code:
```
# switch to develop and update it
git checkout develop
git pull --rebase origin

# switch to feature branch, merge in develop
git checkout -
git merge develop

# resolve any conflicts...
```

Resolve any conflicts on your feature branch. Running `bin/pre-fix` and `bin/pre-push` is recommended (see below). Once ready run `git push origin` from your feature branch.

###### STEP 4: Create a Pull Request
Visit https://github.com/Aftab-Akram/flight-booker/pulls and create a pull request, using `/develop` as the base.

###### STEP 5: Merge into develop
Your reviewer may merge on your behalf or give approval to merge yourself.

* If Github shows merge conflicts, repeat **Step 2** above to resolve them first.

When ready to merge, press  **Merge pull request**  in Github.

**Tada, finished!**&nbsp; 🎉

### Suppress Ruby Deprecation warnings ###


```
vi .bashrc
export RUBYOPT='-W:no-deprecated'
```

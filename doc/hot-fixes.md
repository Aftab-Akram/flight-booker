# Hotfix Process

## What
Hotfixes arise from the necessity to act immediately upon an undesired state of a live production version.
It allows `/master` to be updated by merging in a `/hotfix` branch.

This way the production environment can be updated without merging and deploying all code from `/develop`.

See https://github.com/petervanderdoes/gitflow-avh#creating-featurereleasehotfixsupport-branches

## How
```
# Create a new release tag
RELEASE=release-$(date +%Y%m%d%H%M)

git flow hotfix start $RELEASE
# ... make commits to the hotfix branch...

# Merges to /master and /develop
git flow hotfix finish $RELEASE

# Pushes /master to origin to trigger deployment
git push -v --tags origin refs/heads/master:refs/heads/master

# Push develop branch to origin (should contain the backmerged hotfix changes)
git checkout develop
git push
```

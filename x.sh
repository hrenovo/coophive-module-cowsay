#!/bin/bash

# Iterate over each tag
git tag -l | while read -r tag; do
    # Extract the version number from the description
    version=$(git show "$tag" --pretty=format:%s | grep -oP 'v\d+\.\d+\.\d+')
    if [ -n "$version" ]; then
        # Rename the tag by appending "-pre" to it
        new_tag="${version}-pre"
        git tag "$new_tag" "$tag"
        git tag -d "$tag"
        echo "Renamed tag $tag to $new_tag"
    else
        echo "Skipping tag $tag: Version number not found in description"
    fi
done

git tag v0.0.1-pre -m "ready:cowsay module" $(git rev-list -n 1 v0.0.1) -f
git tag v0.0.2-pre -m "self explanatory cow" $(git rev-list -n 1 v0.0.2) -f
git tag v0.1.0-pre -m "ready:cowsay module" $(git rev-list -n 1 v0.1.0) -f
git tag v0.1.1-pre -m "sync: the modules" $(git rev-list -n 1 v0.1.1) -f

 git tag -l | grep -v -- '-pre$' | xargs -I {} sh -c "git tag -d {} & git push origin --delete {}"

 git tag v0.0.1  -m "rebrand: complete" 
 git tag v0.0.2  -m "rebrand: complete"
 git tag v0.1.0 -m "rebrand: complete"
 git tag v0.1.1 -m "rebrand: complete"
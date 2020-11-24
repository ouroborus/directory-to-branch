#!/bin/sh
set -e

timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

printenv
exit 1;

INPUT_AUTHOR_EMAIL=${INPUT_AUTHOR_EMAIL:-'github-actions[bot]@users.noreply.github.com'}
INPUT_AUTHOR_NAME=${INPUT_AUTHOR_NAME:-'github-actions[bot]'}
INPUT_MESSAGE=${INPUT_MESSAGE:-"chore: autopublish ${timestamp}"}
INPUT_BRANCH=${INPUT_BRANCH:-master}
INPUT_FORCE=${INPUT_FORCE:-false}
INPUT_TAGS=${INPUT_TAGS:-false}
INPUT_EMPTY=${INPUT_EMPTY:-false}
INPUT_DIRECTORY=${INPUT_DIRECTORY:-'.'}

echo "Push to branch $INPUT_BRANCH";
[ -z "${INPUT_GITHUB_TOKEN}" ] && {
    echo 'Missing input "github_token: ${{ secrets.GITHUB_TOKEN }}".';
    exit 1;
};

if ${INPUT_EMPTY}; then
    _EMPTY='--allow-empty'
fi

if ${INPUT_FORCE}; then
    _FORCE_OPTION='--force'
fi

if ${INPUT_TAGS}; then
    _TAGS='--tags'
fi

remote_repo="https://${GITHUB_ACTOR}:${INPUT_GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

cd $(basename ${GITHUB_REPOSITORY})

git config http.sslVerify false


#git config --local user.email "${INPUT_AUTHOR_EMAIL}"
#git config --local user.name "${INPUT_AUTHOR_NAME}"

#git add -A

#git commit -m "{$INPUT_MESSAGE}" $_EMPTY || exit 0

#git push "${remote_repo}" HEAD:"${INPUT_BRANCH}" --follow-tags $_FORCE_OPTION $_TAGS;

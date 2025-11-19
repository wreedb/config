
function github(repo)
    return string.format("https://github.com/%s", repo)
end

function sourcehut(repo)
    return string.format("https://git.sr.ht/~%s", repo)
end

function gitlab(repo)
    return string.format("https://gitlab.com/%s", repo)
end

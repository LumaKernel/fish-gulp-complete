# Completions for gulp
function __fish_print_gulp_targets --argument-names directory file
    set -l gulpflags --cwd $directory
    if test -n "$file"
        set -a gulpflags -f $file
    end

    gulp $gulpflags --tasks-simple 2>/dev/null
end

function __fish_complete_gulp_targets
    set -l directory (string replace -rf '^gulp .*(--cwd(=| +))([^ ]*) .*$' '$3' -- $argv)
    or set directory .
    set -l file (string replace -rf '^gulp .*(-f ?|--gulpfile(=| +))([^ ]*) .*$' '$3' -- $argv)
    __fish_print_gulp_targets $directory $file
end

complete -f -c gulp -a "(__fish_complete_gulp_targets (commandline -p))" -d Task

complete -c gulp -l help -s h -d "Show help"
complete -c gulp -l version -s v -d "Print version"
complete -c gulp -l require -d "Require module"
complete -c gulp -l gulpfile -s f -d "Gulpfile path" -r
complete -x -c gulp -l cwd -d "Working directory" -a "(__fish_complete_directories (commandline -ct))"
complete -c gulp -l verify -d "Verify project package.json"
complete -c gulp -l tasks -s T -d "Print the tasks"
complete -c gulp -l tasks-simple -d "Print the tasks in plaintext"
complete -c gulp -l tasks-json -d "Print the tasks in json"
complete -x -c gulp -l tasks-depth -l depth -d "Depth of tasks"
complete -c gulp -l compact-tasks -d "Print only top tasks"
complete -c gulp -l sort-tasks
complete -c gulp -l color
complete -c gulp -l no-color
complete -c gulp -l silent -s S -d "Silent"
complete -c gulp -l continue -d "Continue upon failure"
complete -c gulp -l series -d "Run tasks given on CLI as series"
complete -c gulp -l log-level -s L -d "Log level"


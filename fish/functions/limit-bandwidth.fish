function limit-bandwidth --description "limit bandwidth to NUM megabytes"
    test -z "$argv[1]"; and return 2
    set -l kilobits (math $argv[1] x 8000)

    pkexec wondershaper -a enp0s31f6 -d $kilobits
end
